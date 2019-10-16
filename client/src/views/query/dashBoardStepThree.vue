<template>
    <div class="dashBoardThree">
        <el-form :inline="true" ref="search_data" :model="search">
            <el-form-item label="年份">
                <el-select v-model="search.year" placeholder="请选择" value="">
                    <el-option
                        v-for="item in options"
                        :label="item.year"
                        :value="item.year">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="handleSearch">搜索</el-button>
            </el-form-item>
        </el-form>
        <div id="chart" style="width: 100%; height: 600px;"></div>
    </div>
</template>

<script>
    import echarts from 'echarts'

    export default {
        name: "dashBoardStepThree",
        data(){
            return {
                search: {
                    year: ''
                },
                options: [],
                dateArr: [],
                numArr: []
            }
        },
        computed: {
            interFace(){
                return this.$store.getters.interface
            },
            bankName(){
                return this.$store.getters.bankname
            },
            year(){
                return this.$store.getters.year
            }
        },
        methods: {
            async getYear(){
                await this.$axios.get('/api/dashboardThree/year').then(res => {
                    if(res.data.status === 200){
                        this.options = res.data.msg;
                    }
                })
            },
            getList(){
                this.$axios.post('/api/dashboardThree', {
                    interface: this.interFace,
                    bankname: this.bankName,
                    year: this.search.year
                }).then(res => {
                    if(res.data.status === 200){
                        for(let i = 0; i < res.data.msg.length; i++){
                            this.dateArr.push(res.data.msg[i].date);
                            this.numArr.push(res.data.msg[i].num);
                        }
                        this.initChart();
                    }
                })
            },
            initChart(){
                const chart = document.getElementById('chart');
                this.chart = echarts.init(chart);
                this.chart.setOption({
                    title : {
                        text: `${this.interFace}下${this.bankName}每天访问数量`,
                        x: 'center',
                        y: '0'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    xAxis: {
                        type: 'category',
                        data: this.dateArr
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: this.numArr,
                        type: 'line',
                        smooth: true
                    }]
                });
            },
            handleSearch(){
                this.dateArr = [];
                this.numArr = [];
                this.getList();
            }
        },
        beforeRouteEnter(to, from, next){
            next(vm => {
                const oDate = new Date();
                vm.search.year = oDate.getFullYear();
                vm.getYear();
                vm.getList();
            })
        }
    }
</script>

<style scoped>
    .dashBoardThree{
        width: 100%;
        height: 100%;
        padding: 15px;
        box-sizing: border-box;
        overflow: hidden;
    }
</style>
