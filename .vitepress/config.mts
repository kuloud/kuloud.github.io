import { defineConfig } from "vitepress";

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
    ],

    sidebar: {
      "/blog/": [
        {
          text: "Blog",
          items: [
            { text: "Hello World", link: "/blog/2025-03-22-hello-world" },
          ],
        },
      ],
      "/presentations/": [
        {
          text: "Presentations",
          items: [
            {
              text: "Hello World",
              link: "/presentations/2025-03-22-hello-world",
            },
          ],
        },
      ],
    },

    socialLinks: [{ icon: "github", link: "https://github.com/kuloud" }],

    footer: {
      copyright: "Copyright © 2024-${new Date().getFullYear()} kuloud",
    },

    search: {
      provider: "local",
    },
  },
});
