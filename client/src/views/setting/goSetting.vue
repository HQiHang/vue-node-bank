<template>
    <div class="goSetting">
        <div class="form">
            <el-form ref="form" :model="form" :rules="form_rules" label-width="120px" style="margin:10px;width:auto;">
                <el-form-item prop="ipaddress" label="ip地址：">
                    <span v-if="text === '编辑'">{{form.ipaddress}}</span>
                    <el-input type="text" v-else v-model="form.ipaddress"></el-input>
                </el-form-item>

                <el-form-item prop="ipport" label="ip端口号：">
                    <span v-if="text === '编辑'">{{form.ipport}}</span>
                    <el-input type="text" v-else v-model="form.ipport"></el-input>
                </el-form-item>

                <el-form-item prop="ftpaddress" label="ftp地址:">
                    <span v-if="text === '编辑'">{{form.ftpaddress}}</span>
                    <el-input type="text" v-else v-model="form.ftpaddress"></el-input>
                </el-form-item>

                <el-form-item prop="ftpport" label="ftp端口号:">
                    <span v-if="text === '编辑'">{{form.ftpport}}</span>
                    <el-input type="text" v-else v-model="form.ftpport"></el-input>
                </el-form-item>

                <el-form-item class="text_right">
                    <el-button type="primary" @click="handleSubmit('form')">{{text}}</el-button>
                    <el-button @click="resetForm('form')">清空</el-button>
                    <el-button @click="handleCancel('form')">取消</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
    export default {
        name: "goSetting",
        data(){
            return {
                text: '编辑',
                form_rules: {
                    ipaddress: [
                        { required: true, message: "ip地址不能为空！", trigger: "blur" }
                    ],
                    ipport: [
                        { required: true, message: "ip端口号不能为空！", trigger: "blur" }
                    ],
                    ftpaddress: [
                        { required: true, message: "ftp地址不能为空！", trigger: "blur" }
                    ],
                    ftpport: [
                        { required: true, message: "ftp端口号不能为空！", trigger: "blur" }
                    ],
                },
                form: {}
            }
        },
        methods: {
            // 读取数据
            async getGoSettingList(){
                let res = await this.$axios.get('/api/goSettingList');
                this.form = res.data.msg[0];
            },
            // 确定
            handleSubmit(form){
                if(this.text === '编辑'){
                    this.text = '保存';
                }else{
                    this.$refs[form].validate(valid => {
                        if (valid) {
                            this.form.ipaddress = String(this.form.ipaddress).trim();
                            this.form.ipport = String(this.form.ipport).trim();
                            this.form.ftpaddress = String(this.form.ftpaddress).trim();
                            this.form.ftpport = String(this.form.ftpport).trim();

                            this.$axios.post('/api/goSetting/edit', this.form).then(res => {
                                this.$message({
                                    message: res.data.msg,
                                    type: "success"
                                });
                                this.text = '编辑';
                                this.getGoSettingList();
                            })
                        }
                    });
                }
            },
            // 清空
            resetForm(formName){
                if(this.text === '编辑'){
                    return false;
                }else {
                    this.$refs[formName].resetFields();
                }
            },
            // 取消
            handleCancel(formName){
                this.getGoSettingList();
                this.$refs[formName].resetFields();
                this.text = '编辑';
            }
        },
        // 初始化
        created(){
            this.getGoSettingList();
        }
    }
</script>

<style scoped>
    .goSetting{
        width: 100%;
        height: 100%;
        padding: 15px;
        box-sizing: border-box;
    }
</style>
