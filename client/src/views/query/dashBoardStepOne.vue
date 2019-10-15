<template>
    <div class="dashBoard">
        <div>
            <el-form :inline="true" ref="search_data" :model="search">
                <el-form-item label="年份">
                    <el-select v-model="search.year" placeholder="请选择">
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
        </div>
        <div id="chart" style="width: 100%; height: 600px;"></div>
    </div>
</template>

<script>
    import echarts from 'echarts'
    export default {
        name: "dashBoard",
        data(){
            return {
                chart: null,
                search: {
                    year: ''
                },
                data: [],
                dataList: [],
                options: [],
            }
        },
        methods: {
            async getData(){
                await this.$axios.post('/api/dashboard', {
                    year: this.search.year
                }).then(res => {
                    if(res.data.status === 200){
                        this.data = res.data.msg;
                        this.$axios.get('/api/dashboard/list').then(res => {
                            if(res.data.status === 200){
                                for(let i = 0; i < res.data.msg.length; i++){
                                    this.dataList.push(res.data.msg[i].interface);
                                }
                                this.initChart();
                            }
                        });
                    }
                })
            },
            async getYear(){
                await this.$axios.get('/api/dashboard/year').then(res => {
                    if(res.data.status === 200){
                        this.options = res.data.msg;
                    }
                })
            },
            initChart(){
                const chart = document.getElementById('chart');
                this.chart = echarts.init(chart);
                this.chart.setOption({
                    title : {
                        text: '各接口银行数量',
                        x: 'center',
                        y: '0'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: params => {
                            this.$router.push({name: 'dashBoardTwo'});
                            this.$store.dispatch('setName', params.name);
                            this.$store.dispatch('setValue', params.value);
                        },
                        triggerOn: 'click'
                    },
                    legend: {
                        orient: 'vertical',
                        left: '0',
                        top: '0',
                        data: this.dataList
                    },
                    series: [
                        {
                            type: 'pie',
                            radius : '70%',
                            center: ['50%', '50%'],
                            data: this.data,
                            label: {
                                formatter: '{b}: {@2012} ({d}%)'
                            },
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                });
            },
            handleSearch(){
                this.getData();
            }
        },
        created(){
            this.$nextTick(() => {
                const oDate = new Date();
                this.search.year = oDate.getFullYear();
                this.getData();
                this.getYear();
            })
        }
    }
</script>

<style scoped>
    .dashBoard{
        width: 100%;
        height: 100%;
        padding: 15px;
        box-sizing: border-box;
        overflow: hidden;
    }
</style>