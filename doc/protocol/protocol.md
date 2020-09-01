## 宴会厅预定系统接口文档

### 登录接口

#### 企业微信code登录
http://booking.switchy.wang/api/auth/code_login.json

请求字段
- code: 企业微信登录code

返回字段
```
{
   "data" : {
      "wechat_id" : "DaMeng",
      "role_type" : "SYSADMIN",
      "name" : "DaMeng",
      "user_id" : 2
   },
   "flag" : 1,
   "msg" : ""
}
```

#### fake_login
http://booking.switchy.wang/api/auth/fake_login.json

### 客户接口

#### 删除
http://booking.switchy.wang/api/customer/delete.json
请求字段
- customer_id： 客户id，多个客户id用"|"分隔

返回字段：
```
{
   "msg" : "",
   "flag" : 1,
   "data" : {
      "customer_list" : [
         {
            "flag" : 1,  // 成功失败
            "msg" : "",  // 失败原因
            "customer_id" : 1  // 序号
         },
         {
            "flag" : 0,
            "customer_id" : 2,
            "msg" : ""
         }
      ]
   }
}
```

#### 修改，增加
http://booking.switchy.wang/api/customer/update.json

请求字段
- customer_id： 客户id
- name： 姓名
- sex:  性别：MALE，FEMALE
- phone_no： 手机号
- wechat_id： 微信号
- customer_type： 客户类型：COMPANY，INDIVIDUAL
- company： 公司名称
- address： 通讯地址
- remark： 备注

返回字段：
```
{
   "msg" : "",
   "flag" : 1,
   "data" : {
      "customer_list" : [
         {
            "flag" : 1,  // 成功失败
            "msg" : "",  // 失败原因
            "customer_id" : 1  // 序号
         },
         {
            "flag" : 0,
            "customer_id" : 2,
            "msg" : ""
         }
      ]
   }
}
```

#### 查询
http://booking.switchy.wang/api/customer/list.json

请求字段
- customer_id： 客户id
- name： 姓名
- sex:  性别：MALE，FEMALE
- phone_no： 手机号
- wechat_id： 微信号
- customer_type： 客户类型：COMPANY，INDIVIDUAL
- company： 公司名称
- address： 通讯地址
- remark： 备注
- keywords： 搜索字段

返回字段：
```
正常返回
{
   "flag" : 1,
   "msg" : "",
   "data" : {
      "customer_list" : [
         {
            "name" : "张三",
            "company" : "一个公司",
            "wechat_id" : "123",
            "address" : "一个地址",
            "remark" : "",
            "customer_type" : "COMPANY",
            "customer_id" : 1,
            "sex" : "MALE",
            "phone_no" : "12311112222"
         },
         {
            "customer_type" : "INDIVIDUAL",
            "customer_id" : 2,
            "sex" : "FEMALE",
            "phone_no" : "12333334444",
            "remark" : "",
            "address" : "",
            "name" : "李四",
            "company" : "",
            "wechat_id" : ""
         }
      ]
   }
}

空数据：
{
   "data" : {
      "customer_list" : []
   },
   "msg" : "",
   "flag" : 1
}
```

### 宴会厅接口

#### 查询
http://booking.switchy.wang/api/customer/list.json
http://booking.switchy.wang/api/customer/list_by_date.json


### 订单接口

#### 创建 & 修改
http://booking.switchy.wang/api/order/update.json

请求字段：
order_id： 订单ID
order_no： 订单编号，16位数字字符串
ballroom_id： 宴会厅ID
customer_id： 客户ID
customer_name： 客户姓名
customer_sex： 客户性别：MALE，男；FEMALE：女
customer_phone_no： 客户手机号
customer_wechat_id： 客户微信号
customer_type： 客户类型：COMPANY，公司；INDIVIDUAL，个人
customer_company： 客户公司
customer_address： 客户地址
customer_remark： 客户备注
use_date： 使用日期：格式，YYYY-MM-DD
use_time： 使用时间：MORNING，上午；AFTERNOON，下午；ALLDAY，全天
use_type： 用途类型：WEDDING，婚宴；MEETING，会议；MEAL：团餐
need_meal：是否用餐：true/false
meal_num： 用餐桌数
meal_unit_price： 餐标、单价；double类型，最多两位小数
need_device：是否使用设备：true/false
device_price： 设备价格
meeting_num： 会议人数
meeting_remark： 会议摆台形式
order_type： 订单类型：TENTATIVE，暂定订单；DEFINITE，确定订单
deposit_price： 定金
price： 总价
remark： 备注
action： 动作，指定该次操作要执行：SAVE，保存按钮；SUBMIT，提交按钮

返回字段：
正常返回
```
{
   "flag" : 1,
   "data" : {
      "order_list" : [
         {
            "flag" : 1,
            "order_no" : "2003091201225557",
            "msg" : "",
            "order_id" : 9
         }
      ]
   },
   "msg" : ""
}
```

异常返回
```
{
   "flag" : 1,
   "msg" : ""
   "data" : null
}
或者
{
   "flag" : 0,
   "msg" : "err_msg",  // 错误信息
   "data" : {
      "order_list" : [
         {
            "flag" : 0,
            "order_no" : "",
            "msg" : "err_msg",  // 具体错误信息
            "order_id" : 0
         }
      ]
   }
}
```

#### 删除
http://booking.switchy.wang/api/order/delete.json

请求字段：
order_id： 订单ID
order_no： 订单编号，16位数字字符串
请求字段需包含order_id、order_no中的一个即可，删除多个订单用'|'分隔；
比如：order_id=1|2|3|4|5

返回字段：
```
{
   "msg" : "",
   "data" : {
      "order_list" : [
         {
            "order_id" : 6,
            "msg" : "",
            "flag" : 1,
            "order_no" : "2003091149393379"
         },
         {
            "flag" : 1,
            "order_no" : "2003091151303226",
            "msg" : "",
            "order_id" : 7
         }
      ]
   },
   "flag" : 0
}
```

#### 查询
http://booking.switchy.wang/api/order/list.json

请求字段：
order_id： 订单ID
order_no： 订单编号，16位数字字符串
ballroom_id： 宴会厅ID
customer_id： 客户ID
customer_name： 客户姓名
use_date： 使用日期：格式，YYYY-MM-DD
use_time： 使用时间：MORNING，上午；AFTERNOON，下午；ALLDAY，全天
use_type： 用途类型：WEDDING，婚宴；MEETING，会议；MEAL：团餐
need_meal：是否用餐：true/false
need_device：是否使用设备：true/false
meeting_remark： 会议摆台形式
order_type： 订单类型：TENTATIVE，暂定订单；DEFINITE，确定订单
remark： 备注
keywords： 搜索字段

返回结构：
```
{
   "msg" : "",
   "flag" : 1
   "data" : {
      "total_count" : 5,
      "order_list" : [
         {
            "order_id" : 9,
            "order_no" : "2003091201225557",
            "order_time" : "2020-03-09 12:01:23",
            "ballroom_id" : 2,
            "order_ballroom" : {
               "origin_id" : 2,
               "ballroom_id" : 15,
               "name" : "梅花三弄厅",
               "img_src" : "http://n.sinaimg.cn/photo/transform/700/w1000h500/20200219/9754-iprtayz7413430.jpg",
               "desc" : "",
               "remark" : "",
               "create_time" : "2020-03-09 12:01:22",
               "update_time" : "2020-03-09 12:01:22"
            },
            "customer_id" : 1,
            "order_customer" : {
               "origin_id" : 1,
               "customer_id" : 9,
               "name" : "张三",
               "sex" : "MALE",
               "phone_no" : "12311112222",
               "wechat_id" : "123",
               "customer_type" : "COMPANY",
               "company" : "一个公司",
               "address" : "一个地址",
               "remark" : "",
               "update_time" : "2020-03-09 12:01:22",
               "create_time" : "2020-03-09 12:01:22"
            },
            "use_date" : "20200309",
            "use_time" : "ALLDAY",
            "use_type" : "WEDDING",
            "need_meal" : false,
            "meal_num" : 0,
            "meal_unit_price" : 0,
            "need_device" : false,
            "device_price" : 0,
            "meeting_num" : 0,
            "meeting_remark" : "",
            "user_id" : 9999,
            "order_type" : "DEFINITE",
            "order_status" : "BOOK_APPROVAL",
            "deposit_price" : 100,
            "price" : 2000.3,
            "remark" : "",
            "create_time" : "2020-03-09 12:01:22",
            "update_time" : "2020-03-09 12:01:22"
         }
      ]
   }
}
```

