const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const db = mysql.createPool({
  host: 'localhost',
  database: 'bank',
  user: 'root',
  password: '123456'
});

router.get('/coSettingList', (req, res) => {
  db.query(`select * from co_setting`, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/coSetting/edit', (req, res) => {
  const ipaddress = req.body.ipaddress;
  const ipport = req.body.ipport;
  const ftpaddress = req.body.ftpaddress;
  const ftpport = req.body.ftpport;
  let sqlStr = "update co_setting set ipaddress = ?, ipport = ?, ftpaddress = ?, ftpport = ? where id = 1";
  let sqlParams = [ipaddress, ipport, ftpaddress, ftpport];
  db.query(sqlStr, sqlParams, (err, data) => {
    if(err){
      res.json({err_code: 404, message: '编辑失败！'});
    }else{
      res.json({status: 200, msg: '编辑成功！'});
    }
  })
});

router.get('/goSettingList', (req, res) => {
  db.query(`select * from go_setting`, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/goSetting/edit', (req, res) => {
  const ipaddress = req.body.ipaddress;
  const ipport = req.body.ipport;
  const ftpaddress = req.body.ftpaddress;
  const ftpport = req.body.ftpport;
  let sqlStr = "update go_setting set ipaddress = ?, ipport = ?, ftpaddress = ?, ftpport = ? where id = 1";
  let sqlParams = [ipaddress, ipport, ftpaddress, ftpport];
  db.query(sqlStr, sqlParams, (err, data) => {
    if(err){
      res.json({err_code: 404, message: '编辑失败！'});
    }else{
      res.json({status: 200, msg: '编辑成功！'});
    }
  })
});

router.post('/boSettingList', (req, res) => {
  const bankid = req.body.bankId;
  const bankname = req.body.bankName;
  let sqlStr = `select * from address_port where bankid like '%${bankid}%' and bankname like '%${bankname}%' order by id desc`;
  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.get('/boSettingList/bankName', (req, res) => {
  db.query(`select distinct bankname as value from address_port`, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/boSetting/add', (req, res) => {
  const bankid = req.body.bankid;
  const bankname = req.body.bankname;
  const activation = req.body.activation;
  const ipaddress = req.body.ipaddress;
  const ipport = req.body.ipport;
  const ftpaddress = req.body.ftpaddress;
  const ftpport = req.body.ftpport;
  let sqlStr = "insert into address_port(bankid, bankname, activation, ipaddress, ipport, ftpaddress, ftpport) values (?, ?, ?, ?, ?, ?, ?)";
  let sqlParams = [bankid, bankname, activation, ipaddress, ipport, ftpaddress, ftpport];
  db.query(sqlStr, sqlParams, (err, data) => {
    if(err){
      res.json({err_code: 404, message: '新增失败！'});
    }else{
      res.json({status: 200, msg: '新增成功！'});
    }
  })
});

router.post('/boSetting/edit', (req, res) => {
  const id = req.body.id;
  const bankid = req.body.bankid;
  const bankname = req.body.bankname;
  const activation = req.body.activation;
  const ipaddress = req.body.ipaddress;
  const ipport = req.body.ipport;
  const ftpaddress = req.body.ftpaddress;
  const ftpport = req.body.ftpport;
  let sqlStr = "update address_port set bankid = ?, bankname = ?, activation = ?, ipaddress = ?, ipport = ?, ftpaddress = ?, ftpport = ? where id = " + id;
  let sqlParams = [bankid, bankname, activation, ipaddress, ipport, ftpaddress, ftpport];
  db.query(sqlStr, sqlParams, (err, data) => {
    if(err){
      res.json({err_code: 404, message: '编辑失败！'});
    }else{
      res.json({status: 200, msg: '编辑成功！'});
    }
  })
});

router.post('/boSetting/delete', (req, res) => {
  const id = req.body.id;
  let sqlStr = "delete from address_port where id = " + id;
  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({err_code: 404, message: '删除失败！'});
    }else{
      res.json({status: 200, msg: '删除成功！'});
    }
  })
});

router.post('/mixQueryList', (req, res) => {
  const request = req.body.request;
  const inter = req.body.interface;
  const startTime = req.body.startTime;
  const endTime = req.body.endTime;
  let sqlStr;
  if(startTime || endTime){
    sqlStr = `select id, request, send, interface, requestcontent, responsecontent, requesttime, responsetime, case status when '1' then '请求和响应都成功' when '2' then '请求成功，响应失败' else '其他待定' end as s from mix_query where request like '%${request}%' and interface like '%${inter}%' and requesttime > '${startTime}' and requesttime < '${endTime}' order by id desc`;
  }else{
    sqlStr = `select id, request, send, interface, requestcontent, responsecontent, requesttime, responsetime, case status when '1' then '请求和响应都成功' when '2' then '请求成功，响应失败' else '其他待定' end as s from mix_query where request like '%${request}%' and interface like '%${inter}%' order by id desc`;
  }
  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.get('/mixQueryList/request', (req, res) => {
  let sqlStr = `select distinct request as value from mix_query`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.get('/mixQueryList/interface', (req, res) => {
  let sqlStr = `select distinct interface as value from mix_query`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/dashboard', (req, res) => {
  const year = req.body.year;
  let sqlStr = `select interface as name, num as value from dashboard where year = '${year}' order by id desc`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data});
    }
  })
});

router.get('/dashboard/list', (req, res) => {
  let sqlStr = `select distinct interface from dashboard`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.get('/dashboard/year', (req, res) => {
  let sqlStr = `select distinct year from dashboard`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/dashboardTwo', (req, res) => {
  const interface = req.body.interface;
  const year = req.body.year;
  let sqlStr = `select bankname as name, number as value from dashboard_two where interface = '${interface}' and year = '${year}' order by id desc`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data});
    }
  })
});

router.post('/dashboardTwo/list', (req, res) => {
  const interface = req.body.interface;
  let sqlStr = `select bankname from dashboard_two where interface = '${interface}'`;

  db.query(sqlStr, (err, data) => {
    if(err){
      console.log(err);
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.get('/dashboardTwo/year', (req, res) => {
  let sqlStr = `select distinct year from dashboard_two`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

router.post('/dashboardThree', (req, res) => {
  const interface = req.body.interface;
  const bankname = req.body.bankname;
  const year = req.body.year;
  let sqlStr = `select * from dashboard_three where interface = '${interface}' and bankname = '${bankname}' and year = '${year}'`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data});
    }
  })
});

router.get('/dashboardThree/year', (req, res) => {
  let sqlStr = `select distinct year from dashboard_three`;

  db.query(sqlStr, (err, data) => {
    if(err){
      res.json({status: 404, msg: '读取数据失败！'});
    }else{
      res.json({status: 200, msg: data})
    }
  })
});

module.exports = router;
