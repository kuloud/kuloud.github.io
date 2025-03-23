import { defineConfig } from "vitepress";

import { generateSidebarConfig } from "./scripts/generate-sidebar";

const currentYear = new Date().getFullYear();

const sidebar = generateSidebarConfig();

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "kuloud",
  description: "Site for kuloud",
  lastUpdated: true,
  head: [
    [
      "script",
      {
        async: "",
        src: "https://www.googletagmanager.com/gtag/js?id=G-5403FHEXGN",
      },
    ],
    [
      "script",
      {},
      `window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-5403FHEXGN');`,
    ],
  ],
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: {
      light: "logo.svg",
      dark: "logo-white.svg",
      alt: "kuloud logo",
    },

    nav: [
      { text: "Home", link: "/" },
      { text: "Blog", link: "/blog/2025-03-22-hello-world" },
      { text: "Presentations", link: "/presentations/2025-03-22-hello-world" },
      {
        text: "Docs",
        items: [
          { text: "amap_map", link: "/projects/amap_map" },
          { text: "auto", link: "/projects/auto/getting-start/introduction" },
        ],
      },
    ],

    sidebar: {
      ...sidebar,
    },

    socialLinks: [{ icon: "github", link: "https://github.com/kuloud" }],

    footer: {
      copyright: `Copyright © ${
        currentYear > 2025 ? `2025-${currentYear}` : "2025"
      } kuloud`,
    },

    search: {
      provider: "local",
    },
  },
  vite: {
    optimizeDeps: {
      exclude: ["vitepress"],
    },
    build: {
      minify: "terser",
      chunkSizeWarningLimit: 1600,
    },
    json: {
      stringify: true,
    },
    ssr: {
      noExternal: ["vitepress"],
    },
    server: {
      fs: {
        strict: true,
      },
    },
    define: {
      "process.env": {},
    },
    resolve: {
      alias: {
        "@auto": "projects/auto",
      },
    },
  },
});
