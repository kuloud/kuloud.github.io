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
    ["link", { rel: "icon", type: "image/x-icon", href: "/favicon.ico" }],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "57x57",
        href: "/apple-icon-57x57.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "60x60",
        href: "/apple-icon-60x60.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "72x72",
        href: "/apple-icon-72x72.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "76x76",
        href: "/apple-icon-76x76.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "114x114",
        href: "/apple-icon-114x114.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "120x120",
        href: "/apple-icon-120x120.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "144x144",
        href: "/apple-icon-144x144.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "152x152",
        href: "/apple-icon-152x152.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "180x180",
        href: "/apple-icon-180x180.png",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "192x192",
        href: "/android-icon-192x192.png",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "32x32",
        href: "/favicon-32x32.png",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "96x96",
        href: "/favicon-96x96.png",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "16x16",
        href: "/favicon-16x16.png",
      },
    ],
    ["link", { rel: "manifest", href: "/manifest.json" }],
    ["meta", { name: "msapplication-TileColor", content: "#ffffff" }],
    [
      "meta",
      { name: "msapplication-TileImage", content: "/ms-icon-144x144.png" },
    ],
    ["meta", { name: "theme-color", content: "#ffffff" }],
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
