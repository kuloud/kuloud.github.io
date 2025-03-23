import fs from "fs";
import path from "path";

const DOCS_ROOT = path.join(__dirname, "../../");
const EXCLUDE_DIRS = new Set([
  "node_modules",
  ".vitepress",
  ".git",
  "dist",
  "build",
]);

export function generateSidebarConfig() {
  const sidebar = {};
  const currentPath = DOCS_ROOT,
    excludeDirs = EXCLUDE_DIRS;

  fs.readdirSync(currentPath).forEach((file) => {
    const filePath = path.join(currentPath, file);
    const stat = fs.statSync(filePath);

    if (stat.isDirectory()) {
      if (excludeDirs && excludeDirs.has(file)) return;

      const subItems = processDirectory(filePath, `/${file}/`);

      if (subItems.length > 0) {
        sidebar[`/${file}/`] = {
          text: formatTitle(file),
          collapsible: true,
          items: subItems,
        };
      }
    } else if (isMarkdownFile(file) && !isIndexFile(file)) {
      const fileContent = fs.readFileSync(filePath, "utf8");
      const frontmatter = parseFrontmatter(fileContent);
      const title = frontmatter.title || formatTitle(file);
      sidebar[`/${file}/`] = {
        text: title,
        link: `/${file.replace(/\.md$/, "")}`,
      };
    }
  });

  // console.log("sidebar", JSON.stringify(sidebar, null, 2));

  return sidebar;
}

function processDirectory(currentPath, routePrefix) {
  const items = [];

  fs.readdirSync(currentPath).forEach((file) => {
    const filePath = path.join(currentPath, file);
    const stat = fs.statSync(filePath);

    if (stat.isDirectory()) {
      const subItems = processDirectory(filePath, `${routePrefix}${file}/`);

      if (subItems.length > 0) {
        items.push({
          text: formatTitle(file),
          collapsible: true,
          items: subItems,
        });
      }
    } else if (isMarkdownFile(file) && !isIndexFile(file)) {
      const fileContent = fs.readFileSync(filePath, "utf8");
      const frontmatter = parseFrontmatter(fileContent);
      const title = frontmatter.title || formatTitle(file);
      items.push({
        text: title,
        link: `${routePrefix}${file.replace(/\.md$/, "")}`,
      });
    }
  });

  const hasIndex = fs.existsSync(path.join(currentPath, "index.md"));
  const hasValidFiles = items.length > 0 || hasIndex;

  if (!hasValidFiles) {
    return [];
  }

  if (hasIndex) {
    items.unshift({
      text: "Overview",
      link: `${routePrefix}`,
    });
  }

  return items.sort((a, b) => {
    const aIsDir = !!a.items;
    const bIsDir = !!b.items;
    if (aIsDir === bIsDir) return a.text.localeCompare(b.text);
    return aIsDir ? -1 : 1;
  });
}

function isMarkdownFile(file) {
  return file.endsWith(".md");
}

function isIndexFile(file) {
  return file.toLowerCase() === "index.md";
}

function formatTitle(filename) {
  if (/^\d{4}-\d{2}-\d{2}-/.test(filename)) {
    return filename
      .replace(/\.md$/, "")
      .replace(/^\d{4}-\d{2}-\d{2}-/, "")
      .replace(/[-_]/g, " ")
      .split(" ")
      .map((word) => word[0].toUpperCase() + word.slice(1))
      .join(" ");
  }
  return filename
    .replace(/\.md$/, "")
    .replace(/^\d+-/, "")
    .split(/[-_]/)
    .map((word) => word[0].toUpperCase() + word.slice(1))
    .join(" ");
}

function parseFrontmatter(content) {
  const frontmatter = {};
  const match = content.match(/^---\n([\s\S]*?)\n---/);

  if (match) {
    match[1].split("\n").forEach((line) => {
      const sepIndex = line.indexOf(":");
      if (sepIndex > 0) {
        const key = line.slice(0, sepIndex).trim();
        const value = line
          .slice(sepIndex + 1)
          .trim()
          .replace(/^['"](.*)['"]$/, "$1");
        frontmatter[key] = value;
      }
    });
  }
  return frontmatter;
}
