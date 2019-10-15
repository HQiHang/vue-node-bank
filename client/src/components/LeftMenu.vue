<template>
    <el-row class="menu-page">
        <el-col>
            <el-menu
                :default-active="this.$route.path.slice(1)"
                mode="vertical"
                background-color="#324057"
                text-color="#fff"
                active-text-color="#409eff"
                class="el-menu-vertical-demo">
                <template v-for="item in items" >
                    <el-submenu v-if="item.children" :index="item.path" :key="item.path">
                        <template slot="title">
                            <span slot="title">{{item.name}}</span>
                        </template>
                        <router-link v-for="(cItem, cIndex) in item.children" :to="cItem.path" :key="cIndex">
                            <el-menu-item :index="cItem.path">
                                <span slot="title">{{cItem.name}}</span>
                            </el-menu-item>
                        </router-link>
                    </el-submenu>
                </template>
            </el-menu>
        </el-col>
    </el-row>
</template>

<script>
    export default {
        name: "LeftMenu",
        data(){
            return {
                items: [
                    {
                        name: "设置",
                        path: "setting",
                        children: [
                            {
                                path: "coSetting",
                                name: "本系统设置"
                            },
                            {
                                path: "goSetting",
                                name: "公积金设置"
                            },
                            {
                                path: "boSetting",
                                name: "各商业银行设置"
                            }
                        ]
                    },
                    {
                        name: "统计查询",
                        path: "query",
                        children: [
                            {
                                path: "mixQuery",
                                name: "综合查询"
                            },
                            {
                                path: "dashBoardOne",
                                name: "仪表盘"
                            }
                        ]
                    }
                ]
            }
        }
    }
</script>

<style scoped>
    .menu-page{
        position: fixed;
        top: 61px;
        left: 0;
        min-height: 100%;
        background-color: #324057;
        z-index: 99;
    }
    .el-menu{
        border: none;
    }
    .fa-margin{
        margin-right: 5px;
    }
    .el-menu-vertical-demo:not(.el-menu--collapse){
        width: 180px;
        min-height: 400px;
    }
    .el-menu-vertical-demo{
        width: 35px;
    }
    .el-submenu .el-menu-item{
        min-width: 180px;
    }
    .hiddenDropdown, .hiddenDropname{
        display: none;
    }
    a{
        text-decoration: none;
    }
</style>