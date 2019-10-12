<template>
    <header class="head-nav">
        <h1>银行管理系统</h1>
    </header>
</template>

<script>
    export default {
        name: "HeaderNav"
    }
</script>

<style scoped>
    .head-nav{
        width: 100%;
        height: 60px;
        min-width: 600px;
        background-color: #324057;
        border-bottom: 1px solid #1f2d3d;
    }
    h1{
        font-size: 30px;
        color: #fff;
        text-align: center;
        line-height: 60px;
    }
</style>