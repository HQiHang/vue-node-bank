import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router);

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '*',
      redirect: '/'
    },
    {
      path: '/',
      redirect: '/index'
    },
    {
      path: '/index',
      name: 'index',
      redirect: '/coSetting',
      component: () => import('./views/Index.vue'),
      children: [
        {
          path: '/coSetting',
          name: 'coSetting',
          component: () => import('./views/setting/coSetting.vue')
        },
        {
          path: '/goSetting',
          name: 'goSetting',
          component: () => import('./views/setting/goSetting.vue')
        },
        {
          path: '/boSetting',
          name: 'boSetting',
          component: () => import('./views/setting/boSetting.vue')
        },
        {
          path: '/mixQuery',
          name: 'mixQuery',
          component: () => import('./views/query/mixQuery.vue')
        },
        {
          path: '/dashBoardOne',
          name: 'dashBoardOne',
          component: () => import('./views/query/dashBoardStepOne.vue')
        },
        {
          path: '/dashBoardTwo',
          name: 'dashBoardTwo',
          component: () => import('./views/query/dashBoardStepTwo.vue')
        },
        {
          path: '/dashBoardThree',
          name: 'dashBoardThree',
          component: () => import('./views/query/dashBoardStepThree.vue')
        }
      ]
    }
  ]
});

export default router;