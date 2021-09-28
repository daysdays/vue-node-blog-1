import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '@/components/Index'
import Details from '@/components/Details'
import Archives from '@/components/Archives'
import Tag from '@/components/Tag'
import About from '@/components/About'
import Admin from '@/components/Admin'
import Edit from '@/components/Edit'
import Create from '@/components/Create'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/blog'
  },
  {
    path: '/blog',
    name: 'Index',
    component: Index,
  },
  {
    path: '/details',
    name: 'Details',
    component: Details,
  },
  {
    path: '/archives',
    name: 'archives',
    component: Archives,
  },
  {
    path: '/tag',
    name: 'tag',
    component: Tag,
  },
  {
    path: '/about',
    name: 'About',
    component: About,
  },
  {
    path: '/admin',
    name: 'Admin',
    component: Admin,
  },
  {
    path: '/create',
    name: 'Create',
    component: Create,
  },
  {
    path: '/edit',
    name: 'Edit',
    component: Edit,
  },
]

const router = new VueRouter({
  routes
})

export default router
