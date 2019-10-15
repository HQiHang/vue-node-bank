<template>
    <div class="mixQuery">
        <!--搜索-->
        <div>
            <el-form :inline="true" ref="search_data" :model="search">
                <el-form-item label="请求方">
                    <el-autocomplete
                        class="inline-input"
                        v-model="search.request"
                        :fetch-suggestions="querySearch1"
                        placeholder="输入请求方"
                    ></el-autocomplete>
                </el-form-item>
                <el-form-item label="接口名称">
                    <el-autocomplete
                        class="inline-input"
                        v-model="search.interface"
                        :fetch-suggestions="querySearch2"
                        placeholder="输入接口名称"
                    ></el-autocomplete>
                </el-form-item>
                <el-form-item label="请求时间">
                    <el-date-picker v-model="search.startTime" type="datetime" placeholder="选择开始时间"></el-date-picker>--
                    <el-date-picker v-model="search.endTime" type="datetime" placeholder="选择结束时间"></el-date-picker>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" size="small" @click="handleSearch">搜索</el-button>
                    <el-button type="default" size="small" @click="handleEmpty">清空</el-button>
                </el-form-item>
            </el-form>
        </div>
        <!--表格-->
        <div class="table-container">
            <el-table v-if="tableData.length > 0" :data="tableData" border style="width: 100%">
                <el-table-column prop="request" label="请求方"></el-table-column>
                <el-table-column prop="send" label="发送方"></el-table-column>
                <el-table-column prop="interface" label="访问的接口名称"></el-table-column>
                <el-table-column prop="requestcontent" label="请求内容"></el-table-column>
                <el-table-column prop="responsecontent" label="响应内容"></el-table-column>
                <el-table-column prop="requesttime" label="请求时间"></el-table-column>
                <el-table-column prop="responsetime" label="响应时间"></el-table-column>
                <el-table-column prop="s" label="状态"></el-table-column>
            </el-table>
            <!-- 分页 -->
            <el-row>
                <el-col :span="24">
                    <div class="pagination">
                        <el-pagination
                            v-if="paginations.total > 0"
                            :page-sizes="paginations.page_sizes"
                            :page-size="paginations.page_size"
                            :layout="paginations.layout"
                            :total="paginations.total"
                            :current-page.sync="paginations.page_index"
                            @current-change="handleCurrentChange"
                            @size-change="handleSizeChange"
                        ></el-pagination>
                    </div>
                </el-col>
            </el-row>
        </div>
    </div>
</template>

<script>
    export default {
        name: "boSetting",
        data(){
            return {
                form: {
                    id: '',
                    request: '',
                    send: '',
                    interface: '',
                    requestcontent: '',
                    responsecontent: '',
                    requesttime: '',
                    responsetime: '',
                    status: ''
                },
                search: {
                    request: '',
                    interface: '',
                    startTime: '',
                    endTime: ''
                },
                tableData: [],
                allTableData: [],
                filterTableData: [],
                //需要给分页组件传的信息
                paginations: {
                    page_index: 1, // 当前位于哪页
                    total: 0, // 总数
                    page_size: 9, // 1页显示多少条
                    page_sizes: [5, 9], //每页显示多少条
                    layout: "total, sizes, prev, pager, next, jumper" // 翻页属性
                },
                requests: [],
                interfaces: []
            }
        },
        methods: {
            // 输入建议
            querySearch1(queryString, cb) {
                const requests = this.requests;
                const results = queryString ? requests.filter(this.createFilter(queryString)) : requests;
                // 调用 callback 返回建议列表的数据
                cb(results);
            },
            querySearch2(queryString, cb) {
                const interfaces = this.interfaces;
                const results = queryString ? interfaces.filter(this.createFilter(queryString)) : interfaces;
                // 调用 callback 返回建议列表的数据
                cb(results);
            },
            createFilter(queryString) {
                return (res) => {
                    return (res.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                };
            },
            // 时间格式化
            formatTime(num){
                return num < 10 ? '0' + num : '' + num;
            },
            // 初始化表格
            getUser(){
                this.$axios.post('/api/mixQueryList', this.search).then(res => {
                    if(res.data.status === 200){
                        for(let i = 0; i < res.data.msg.length; i++){
                            const requesttime = new Date(res.data.msg[i].requesttime);
                            const responsetime = new Date(res.data.msg[i].responsetime);
                            res.data.msg[i].requesttime = this.formatTime(requesttime.getFullYear() + '-' + this.formatTime(requesttime.getMonth() + 1) + '-' + this.formatTime(requesttime.getDate()) + ' ' + this.formatTime(requesttime.getHours()) + ':' + this.formatTime(requesttime.getMinutes()) + ':' + this.formatTime(requesttime.getSeconds()));
                            res.data.msg[i].responsetime = this.formatTime(responsetime.getFullYear() + '-' + this.formatTime(responsetime.getMonth() + 1) + '-' + this.formatTime(responsetime.getDate()) + ' ' + this.formatTime(responsetime.getHours()) + ':' + this.formatTime(responsetime.getMinutes()) + ':' + this.formatTime(responsetime.getSeconds()));
                        }
                        this.allTableData = res.data.msg;
                        this.filterTableData = res.data.msg;
                    }
                    this.setPaginations();
                })
            },
            // 分页
            handleCurrentChange(page){
                // 当前页
                let sortNum = this.paginations.page_size * (page - 1);
                let table = this.allTableData.filter((item, index) => {
                    return index >= sortNum;
                });
                // 设置默认分页数据
                this.tableData = table.filter((item, index) => {
                    return index < this.paginations.page_size;
                });
            },
            handleSizeChange(page_size){
                // 切换size
                this.paginations.page_index = 1;
                this.paginations.page_size = page_size;
                this.tableData = this.allTableData.filter((item, index) => {
                    return index < page_size;
                });
            },
            setPaginations(){
                // 总页数
                this.paginations.total = this.allTableData.length;
                this.paginations.page_index = 1;
                this.paginations.page_size = 9;
                // 设置默认分页数据
                this.tableData = this.allTableData.filter((item, index) => {
                    return index < this.paginations.page_size;
                });
            },
            // 搜索
            handleSearch(){
                this.search.request = String(this.search.request).trim();
                this.search.interface = String(this.search.interface).trim();
                this.getUser();
            },
            // 清空搜索
            handleEmpty() {
                this.search = {
                    request: '',
                    interface: '',
                    startTime: '',
                    endTime: ''
                };
                // 初始化
                this.getUser();
            },
            // 读取请求方
            async loadRequest(){
                await this.$axios.get('/api/mixQueryList/request').then(res => {
                    if(res.data.status === 200){
                        this.requests = res.data.msg
                    }
                });
            },
            // 读取接口
            async loadInterface(){
                await this.$axios.get('/api/mixQueryList/interface').then(res => {
                    if(res.data.status === 200){
                        this.interfaces = res.data.msg
                    }
                });
            }
        },
        // 初始化
        created(){
            this.getUser();
            this.loadRequest();
            this.loadInterface();
        }
    }
</script>

<style scoped>
    .mixQuery {
        width: 100%;
        height: 100%;
        padding: 15px;
        box-sizing: border-box;
    }
    .pagination {
        text-align: right;
        margin-top: 10px;
    }
</style>