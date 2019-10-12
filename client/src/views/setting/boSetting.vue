<template>
    <div class="boSetting">
        <!--搜索-->
        <div class="search">
            <el-form :inline="true" ref="search_data" :model="search">
                <el-form-item label="银行id">
                    <el-input v-model="search.bankId" type="text" placeholder="输入银行id"></el-input>
                </el-form-item>
                <el-form-item label="银行名称">
                    <el-autocomplete
                        class="inline-input"
                        v-model="search.bankName"
                        :fetch-suggestions="querySearch"
                        placeholder="输入银行名称"
                    ></el-autocomplete>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" size="small" @click="handleSearch">搜索</el-button>
                    <el-button type="default" size="small" @click="handleEmpty">清空</el-button>
                </el-form-item>
                <el-form-item class="btnRight">
                    <el-button
                        type="primary"
                        size="small"
                        icon="view"
                        @click="handleAdd()"
                    >添加</el-button>
                </el-form-item>
            </el-form>
        </div>
        <!--表格-->
        <div class="table-container">
            <el-table v-if="tableData.length > 0" :data="tableData" border style="width: 100%">
                <el-table-column prop="bankid" label="银行id" width="100"></el-table-column>
                <el-table-column prop="bankname" label="银行名称"></el-table-column>
                <el-table-column prop="activation" label="是否激活" width="100"></el-table-column>
                <el-table-column prop="ipaddress" label="ip地址"></el-table-column>
                <el-table-column prop="ipport" label="ip端口号"></el-table-column>
                <el-table-column prop="ftpaddress" label="ftp地址"></el-table-column>
                <el-table-column prop="ftpport" label="ftp端口号"></el-table-column>
                <el-table-column prop="operation" align="center" label="操作" width="180">
                    <template slot-scope="scope">
                        <el-button type="warning" size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                        <el-button type="danger" size="mini" @click="handleCancel(scope.row)">删除</el-button>
                    </template>
                </el-table-column>
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
        <DialogSetting :dialog="dialog" :form="form" @update="getUser"></DialogSetting>
    </div>
</template>

<script>
    import DialogSetting from '../../components/DialogSetting'

    export default {
        name: "boSetting",
        components: {
            DialogSetting
        },
        data(){
            return {
                dialog: {
                    show: false,
                    title: '',
                    option: 'edit'
                },
                form: {
                    id: '',
                    bankid: '',
                    bankname: '',
                    activation: '',
                    ipaddress: '',
                    ipport: '',
                    ftpaddress: '',
                    ftpport: ''
                },
                search: {
                    bankId: '',
                    bankName: ''
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
                bankNames: []
            }
        },
        methods: {
            // 初始化表格
            getUser(){
                this.$axios.post('/api/boSettingList', this.search).then(res => {
                    if(res.data.status === 200){
                        this.allTableData = res.data.msg;
                        this.filterTableData = res.data.msg;
                    }
                    this.setPaginations();
                })
            },
            // 输入建议
            querySearch(queryString, cb) {
                const bankNames = this.bankNames;
                const results = queryString ? bankNames.filter(this.createFilter(queryString)) : bankNames;
                // 调用 callback 返回建议列表的数据
                cb(results);
            },
            createFilter(queryString) {
                return (bankNames) => {
                    return (bankNames.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                };
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
                this.search.bankId = String(this.search.bankId).trim();
                this.search.bankName = String(this.search.bankName).trim();
                this.getUser();
                /*if(!this.search.bankId && !this.search.bankName){
                    this.getUser();
                }else{
                    const bankId = this.search.bankId.trim();
                    const bankName = this.search.bankName.trim();
                    this.allTableData = this.filterTableData.filter(item => {
                        return (
                            String(item.bankid).includes(bankId) &&
                            String(item.bankname).includes(bankName)
                        );
                    });
                    // 分页数据
                    this.setPaginations();
                }*/
            },
            // 清空搜索
            handleEmpty(){
                this.search = {
                    bankId: '',
                    bankName: ''
                };
                // 初始化
                this.getUser();
            },
            // 新增
            handleAdd(){
                this.dialog = {
                    show: true,
                    title: '新增',
                    option: 'add'
                };
                this.form = {
                    id: '',
                    bankid: '',
                    bankname: '',
                    activation: '',
                    ipaddress: '',
                    ipport: '',
                    ftpaddress: '',
                    ftpport: ''
                }
            },
            // 编辑
            handleEdit(row){
                this.dialog = {
                    show: true,
                    title: "编辑",
                    option: 'edit'
                };
                this.form = {
                    id: row.id,
                    bankid: row.bankid,
                    bankname: row.bankname,
                    activation: row.activation,
                    ipaddress: row.ipaddress,
                    ipport: row.ipport,
                    ftpaddress: row.ftpaddress,
                    ftpport: row.ftpport
                };
            },
            // 删除
            handleCancel(row){
                this.$confirm('确定删除吗？', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    const id = row.id;
                    this.$axios.post('/api/boSetting/delete', {
                        id
                    }).then(res => {
                        this.$message({
                            message: res.data.msg,
                            type: "success"
                        });
                        this.getUser();
                    })
                })
            },
            // 读取银行名称
            async bankName(){
                await this.$axios.get('/api/boSettingList/bankName').then(res => {
                    if(res.data.status === 200){
                        this.bankNames = res.data.msg
                    }
                })
            }
        },
        // 初始化
        created(){
            this.getUser();
            this.bankName();
        }
    }
</script>

<style scoped>
    .boSetting {
        width: 100%;
        height: 100%;
        padding: 16px;
        box-sizing: border-box;
    }
    .btnRight {
        float: right;
    }
    .pagination {
        text-align: right;
        margin-top: 10px;
    }
</style>