import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "../components/admin/Login";
import Index from '../components/Index'
import Details from '../components/Details'
import Archives from '../components/Archives'
import Tag from '../components/Tag'
import About from '../components/About'
import Admin from "../components/admin/Admin";
import Create from "../components/admin/Create";
import Edit from "../components/admin/Edit";

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        redirect: '/blog'
    },
    {
        path: '/blog',
        component: Index,
    },
    {
        path: '/details',
        component: Details,
    },
    {
        path: '/archives',
        component: Archives,
    },
    {
        path: '/tag',
        component: Tag,
    },
    {
        path: '/about',
        component: About,
    },
    {
        path: '/admin',
        component: Admin,
        // children: []
    },
    {
        path: '/create',
        component: Create,
    },
    {
        path: '/edit',
        component: Edit,
    },
    {
        path: '/login',
        component: Login,
    },
]

const router = new VueRouter({
    routes
})


// 挂在路由导航守卫
router.beforeEach((to, from, next) => {
    //    to 将要访问的路径
    //    from 代表从哪个路径跳转而来
    //    next 是一个函数，表示放行
    //    next() 放行  next('/login') 强制转跳
    if (
        // 如果访问以下路径，直接放行
        to.path == '/login' ||
        to.path == '/blog' ||
        to.path == '/archives' ||
        to.path == '/tag' ||
        to.path == '/about') {
        return next();
    }
    //  获取token，有token就放行，没有则返回登录界面
    const tokenStr = window.sessionStorage.getItem('token')
    if (!tokenStr) return next('/login')
    next()
})

export default router
