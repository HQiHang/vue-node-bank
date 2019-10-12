<template>
   <div class="dialog">
       <el-dialog
           :title="dialog.title"
           :visible.sync="dialog.show"
           :close-on-click-modal="false"
           :close-on-press-escape="false"
           :modal-append-to-body="false"
       >
           <div class="form">
               <el-form
                   ref="form"
                   :model="form"
                   :rules="form_rules"
                   label-width="120px"
                   style="margin:10px;width:auto;"
               >
                   <el-form-item prop="id" label="序号：" v-if="dialog.option === 'edit'">
                       <el-input type="text" disabled v-model="form.id"></el-input>
                   </el-form-item>

                   <el-form-item prop="bankid" label="银行id：">
                       <el-input type="text" v-model="form.bankid"></el-input>
                   </el-form-item>

                   <el-form-item prop="bankname" label="银行名称：">
                       <el-input type="text" v-model="form.bankname"></el-input>
                   </el-form-item>

                   <el-form-item prop="activation" label="是否激活：">
                       <el-radio v-model="form.activation" label="是">是</el-radio>
                       <el-radio v-model="form.activation" label="否">否</el-radio>
                   </el-form-item>

                   <el-form-item prop="ipaddress" label="ip地址：">
                       <el-input type="text" v-model="form.ipaddress"></el-input>
                   </el-form-item>

                   <el-form-item prop="ipport" label="ip端口号：">
                       <el-input type="text" v-model="form.ipport"></el-input>
                   </el-form-item>

                   <el-form-item prop="ftpaddress" label="ftp地址:">
                       <el-input type="text" v-model="form.ftpaddress"></el-input>
                   </el-form-item>

                   <el-form-item prop="ftpport" label="ftp端口号:">
                       <el-input type="text" v-model="form.ftpport"></el-input>
                   </el-form-item>

                   <el-form-item class="text_right">
                       <el-button type="primary" @click="onSubmit('form')">确定</el-button>
                       <el-button @click="dialog.show = false">取消</el-button>
                   </el-form-item>
               </el-form>
           </div>
       </el-dialog>
   </div>
</template>

<script>
    export default {
        name: "DialogCoSetting",
        props: {
            dialog: Object,
            form: Object
        },
        data(){
            return {
                form_rules: {
                    bankid: [
                        { required: true, message: "银行id不能为空！", trigger: "blur" }
                    ],
                    bankname: [
                        { required: true, message: "银行名称不能为空！", trigger: "blur" }
                    ],
                    activation: [
                        { required: true, message: "请选择是否激活！", trigger: "blur" }
                    ],
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
                }
            }
        },
        methods: {
            onSubmit(form){
                this.$refs[form].validate(valid => {
                    if(valid){
                        const option = this.dialog.option;
                        const url = option === 'edit' ? '/api/boSetting/edit' : '/api/boSetting/add';
                        this.form.bankid = String(this.form.bankid).trim();
                        this.form.bankname = String(this.form.bankname).trim();
                        this.form.activation = String(this.form.activation).trim();
                        this.form.ipaddress = String(this.form.ipaddress).trim();
                        this.form.ipport = String(this.form.ipport).trim();
                        this.form.ftpaddress = String(this.form.ftpaddress).trim();
                        this.form.ftpport = String(this.form.ftpport).trim();

                        this.$axios.post(url, this.form).then(res => {
                            if(res.data.status === 200){
                                this.$message({
                                    message: res.data.msg,
                                    type: "success"
                                });
                                this.dialog.show = false;
                                this.$emit("update");
                            }
                        });
                    }
                })
            }
        }
    }
</script>

<style scoped>

</style>