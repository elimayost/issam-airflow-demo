//const { description } = require('../../package')

module.exports = {
  base: '/eli-mayost/airflow-demo/',      
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#title
   */
  title: 'Airflow Demo',
  /**
   * Ref：https://v1.vuepress.vuejs.org/config/#description
   */
  //description: description,
  description: '',

  /**
   * Extra tags to be injected to the page HTML `<head>`
   *
   * ref：https://v1.vuepress.vuejs.org/config/#head
   */
  head: [
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }]
  ],

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: false,
    docsDir: '',
    editLinkText: '',
    lastUpdated: false,
    sidebar: [
      {
        title: 'What it is',
        path: '/what_it_is/'
      },
      {
        title: 'Overview',
        path: '/overview/'
      },
      {
        title: 'Set up local environment',
        path: '/environment/'
      },
      {
        title: 'Airflow UI',
        path: '/airflow_ui/'
      },
    ] 
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    '@vuepress/plugin-back-to-top',
    '@vuepress/plugin-medium-zoom',
  ]
}
