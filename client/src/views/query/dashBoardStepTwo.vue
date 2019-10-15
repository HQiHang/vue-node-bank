<template>
    <div class="dashBoardStepTwo">
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
        name: "dashBoardStepTwo",
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
        computed: {
            name(){
                return this.$store.getters.name;
            },
            value(){
                return this.$store.getters.value;
            }
        },
        methods: {
            async getYear(){
                await this.$axios.get('/api/dashboardTwo/year').then(res => {
                    if(res.data.status === 200){
                        this.options = res.data.msg;
                    }
                })
            },
            getList(){
                this.$axios.post('/api/dashboardTwo', {
                    interface: this.name,
                    year: this.search.year
                }).then(res => {
                    if(res.data.status === 200){
                        this.data = res.data.msg;
                        this.$axios.post('/api/dashboardTwo/list', {
                            interface: this.name
                        }).then(res => {
                            if(res.data.status === 200){
                                for(let i = 0; i < res.data.msg.length; i++){
                                    this.dataList.push(res.data.msg[i].bankname);
                                }
                                this.initChart();
                            }
                        });
                    }
                })
            },
            initChart(){
                const chart = document.getElementById('chart');
                this.chart = echarts.init(chart);
                this.chart.setOption({
                    title : {
                        text: `${this.name}下各银行分布情况`,
                        x: 'center',
                        y: '0'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: params => {
                            this.$router.push({name: 'dashBoardThree'});
                            this.$store.dispatch('setInterFace', this.name);
                            this.$store.dispatch('setBankName', params.name);
                            this.$store.dispatch('setYear', this.search.year);
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
    .dashBoardStepTwo{
        width: 100%;
        height: 100%;
        padding: 15px;
        box-sizing: border-box;
        overflow: hidden;
    }
</style>