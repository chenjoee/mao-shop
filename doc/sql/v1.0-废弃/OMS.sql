create table oms_order
(
   id                   bigint not null auto_increment comment '订单id',
   member_id            bigint not null comment '会员id',
   coupon_id            bigint comment '优惠券id',
   order_sn             varchar(64) comment '订单编号',
   create_time          datetime comment '提交时间',
   member_username      varchar(64) comment '用户帐号',
   total_amount         decimal(10,2) comment '订单总金额',
   pay_amount           decimal(10,2) comment '应付金额（实际支付金额）',
   freight_amount       decimal(10,2) comment '运费金额',
   promotion_amount     decimal(10,2) comment '促销优化金额（促销价、满减、阶梯价）',
   integration_amount   decimal(10,2) comment '积分抵扣金额',
   coupon_amount        decimal(10,2) comment '优惠券抵扣金额',
   discount_amount      decimal(10,2) comment '管理员后台调整订单使用的折扣金额',
   pay_type             int(1) comment '支付方式：0->未支付；1->支付宝；2->微信',
   source_type          int(1) comment '订单来源：0->PC订单；1->app订单',
   status               int(1) comment '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
   order_type           int(1) comment '订单类型：0->正常订单；1->秒杀订单',
   delivery_company     varchar(64) comment '物流公司(配送方式)',
   delivery_sn          varchar(64) comment '物流单号',
   auto_confirm_day     int comment '自动确认时间（天）',
   integration          int comment '可以获得的积分',
   growth               int comment '可以活动的成长值',
   promotion_info       varchar(100) comment '活动信息',
   bill_type            int(1) comment '发票类型：0->不开发票；1->电子发票；2->纸质发票',
   bill_header          varchar(200) comment '发票抬头',
   bill_content         varchar(200) comment '发票内容',
   bill_receiver_phone  varchar(32) comment '收票人电话',
   bill_receiver_email  varchar(64) comment '收票人邮箱',
   receiver_name        varchar(100) not null comment '收货人姓名',
   receiver_phone       varchar(32) not null comment '收货人电话',
   receiver_post_code   varchar(32) comment '收货人邮编',
   receiver_province    varchar(32) comment '省份/直辖市',
   receiver_city        varchar(32) comment '城市',
   receiver_region      varchar(32) comment '区',
   receiver_detail_address varchar(200) comment '详细地址',
   note                 varchar(500) comment '订单备注',
   confirm_status       int(1) comment '确认收货状态：0->未确认；1->已确认',
   delete_status        int(1) not null default 0 comment '删除状态：0->未删除；1->已删除',
   use_integration      int comment '下单时使用的积分',
   payment_time         datetime comment '支付时间',
   delivery_time        datetime comment '发货时间',
   receive_time         datetime comment '确认收货时间',
   comment_time         datetime comment '评价时间',
   modify_time          datetime comment '修改时间',
   primary key (id)
);

create table oms_order_item
(
   id                   bigint not null auto_increment,
   order_id             bigint comment '订单id',
   order_sn             varchar(64) comment '订单编号',
   product_id           bigint comment '商品id',
   product_pic          varchar(500) comment '商品图片',
   product_name         varchar(200) comment '商品名称',
   product_brand        varchar(200) comment '商品品牌',
   product_sn           varchar(64) comment '商品条码',
   product_price        decimal(10,2) comment '销售价格',
   product_quantity     int comment '购买数量',
   product_sku_id       bigint comment '商品sku编号',
   product_sku_code     varchar(50) comment '商品sku条码',
   product_category_id  bigint comment '商品分类id',
   sp1                  varchar(100) comment '商品的销售属性1',
   sp2                  varchar(100) comment '商品的销售属性2',
   sp3                  varchar(100) comment '商品的销售属性3',
   promotion_name       varchar(200) comment '商品促销名称',
   promotion_amount     decimal(10,2) comment '商品促销分解金额',
   coupon_amount        decimal(10,2) comment '优惠券优惠分解金额',
   integration_amount   decimal(10,2) comment '积分优惠分解金额',
   real_amount          decimal(10,2) comment '该商品经过优惠后的分解金额',
   gift_integration     int not null default 0 comment '商品赠送积分',
   gift_growth          int not null default 0 comment '商品赠送成长值',
   product_attr         varchar(500) comment '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
   primary key (id)
);

-- 订单操作记录表 当订单状态发生改变时，用于记录订单的操作信息。
create table oms_order_operate_history
(
   id                   bigint not null auto_increment,
   order_id             bigint comment '订单id',
   operate_man          varchar(100) comment '操作人：用户；系统；后台管理员',
   create_time          datetime comment '操作时间',
   order_status         int(1) comment '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
   note                 varchar(500) comment '备注',
   primary key (id)
);

-- 订单设置 用于对订单的一些超时操作进行设置。
create table oms_order_setting
(
   id                   bigint not null auto_increment,
   flash_order_overtime int comment '秒杀订单超时关闭时间(分)',
   normal_order_overtime int comment '正常订单超时时间(分)',
   confirm_overtime     int comment '发货后自动确认收货时间（天）',
   finish_overtime      int comment '自动完成交易时间，不能申请售后（天）',
   comment_overtime     int comment '订单完成后自动好评时间（天）',
   primary key (id)
);


-- 购物车表 用于存储购物车中每个商品信息，可用于计算商品优惠金额。
create table oms_cart_item
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品的id',
   product_sku_id       bigint comment '商品sku的id',
   member_id            bigint comment '会员id',
   quantity             int comment '购买数量',
   price                decimal(10,2) comment '添加到购物车的价格',
   sp1                  varchar(200) comment '销售属性1',
   sp2                  varchar(200) comment '销售属性2',
   sp3                  varchar(200) comment '销售属性3',
   product_pic          varchar(1000) comment '商品主图',
   product_name         varchar(500) comment '商品名称',
   product_brand        varchar(200) comment '商品品牌',
   product_sn           varchar(200) comment '商品的条码',
   product_sub_title    varchar(500) comment '商品副标题（卖点）',
   product_sku_code     varchar(200) comment '商品sku条码',
   member_nickname      varchar(500) comment '会员昵称',
   create_date          datetime comment '创建时间',
   modify_date          datetime comment '修改时间',
   delete_status        int(1) default 0 comment '是否删除',
   product_category_id  bigint comment '商品的分类',
   product_attr         varchar(500) comment '商品销售属性:[{"key":"颜色","value":"银色"},{"key":"容量","value":"4G"}]',
   primary key (id)
);


-- 订单退货
-- 订单退货申请表
-- 主要用于存储会员退货申请信息，需要注意的是订单退货申请表的四种状态：0->待处理；1->退货中；2->已完成；3->已拒绝。
create table oms_order_return_apply
(
   id                   bigint not null auto_increment,
   order_id             bigint comment '订单id',
   company_address_id   bigint comment '收货地址表id',
   product_id           bigint comment '退货商品id',
   order_sn             varchar(64) comment '订单编号',
   create_time          datetime comment '申请时间',
   member_username      varchar(64) comment '会员用户名',
   return_amount        decimal(10,2) comment '退款金额',
   return_name          varchar(100) comment '退货人姓名',
   return_phone         varchar(100) comment '退货人电话',
   status               int(1) comment '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
   handle_time          datetime comment '处理时间',
   product_pic          varchar(500) comment '商品图片',
   product_name         varchar(200) comment '商品名称',
   product_brand        varchar(200) comment '商品品牌',
   product_attr         varchar(500) comment '商品销售属性：颜色：红色；尺码：xl;',
   product_count        int comment '退货数量',
   product_price        decimal(10,2) comment '商品单价',
   product_real_price   decimal(10,2) comment '商品实际支付单价',
   reason               varchar(200) comment '原因',
   description          varchar(500) comment '描述',
   proof_pics           varchar(1000) comment '凭证图片，以逗号隔开',
   handle_note          varchar(500) comment '处理备注',
   handle_man           varchar(100) comment '处理人员',
   receive_man          varchar(100) comment '收货人',
   receive_time         datetime comment '收货时间',
   receive_note         varchar(500) comment '收货备注',
   primary key (id)
);

--  公司收货地址表 用于处理退货申请时选择收货地址。
create table oms_company_address
(
   id                   bigint not null auto_increment,
   address_name         varchar(200) comment '地址名称',
   send_status          int(1) comment '默认发货地址：0->否；1->是',
   receive_status       int(1) comment '是否默认收货地址：0->否；1->是',
   name                 varchar(64) comment '收发货人姓名',
   phone                varchar(64) comment '收货人电话',
   province             varchar(64) comment '省/直辖市',
   city                 varchar(64) comment '市',
   region               varchar(64) comment '区',
   detail_address       varchar(200) comment '详细地址',
   primary key (id)
);

