// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },
  vite: {
    vue: {
      template: {
        preprocessOptions: {
          pug: {
            doctype: 'html'
          }
        }
      }
    }
  },
  app: {
    head: {
      link: [
        {
          rel: 'icon',
          type: 'image/png',
          href: '/favicon.png',
        }
      ]
    }
  }
})
