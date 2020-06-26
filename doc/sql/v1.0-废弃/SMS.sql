-- 营销模块数据库表解析：限时购功能

-- 限时购表 用于存储限时购活动的信息，包括开始时间、结束时间以及上下线状态。
create table sms_flash_promotion
(
   id                   bigint not null auto_increment,
   title                varchar(200) comment '标题',
   start_date           date comment '开始日期',
   end_date             date comment '结束日期',
   status               int(1) comment '上下线状态',
   create_time          datetime comment '创建时间',
   primary key (id)
);


-- 限时购场次表
-- 用于存储限时购场次的信息，在一天中，一个限时购活动会有多个不同的活动时间段。
create table sms_flash_promotion_session
(
   id                   bigint not null auto_increment comment '编号',
   name                 varchar(200) comment '场次名称',
   start_time           time comment '每日开始时间',
   end_time             time comment '每日结束时间',
   status               int(1) comment '启用状态：0->不启用；1->启用',
   create_time          datetime comment '创建时间',
   primary key (id)
);

-- 限时购与商品关系表
-- 用于存储与限时购相关的商品信息，一个限时购中有多个场次，每个场次都可以设置不同活动商品。
create table sms_flash_promotion_product_relation
(
   id                   bigint not null auto_increment,
   flash_promotion_id   bigint comment '限时购id',
   flash_promotion_session_id bigint comment '编号',
   product_id           bigint comment '商品价格',
   flash_promotion_price decimal(10,2) comment '限时购价格',
   flash_promotion_count int comment '限时购数量',
   flash_promotion_limit int comment '每人限购数量',
   sort                 int comment '排序',
   primary key (id)
);


-- 限时购通知记录表
-- 用于存储会员的限时购预约记录，当有的限时购场次还未开始时，会员可以进行预约操作，当场次开始时，系统会进行提醒。
create table sms_flash_promotion_log
(
   id                   int not null auto_increment,
   member_id            int comment '会员id',
   product_id           bigint comment '商品id',
   member_phone         varchar(64) comment '会员电话',
   product_name         varchar(100) comment '商品名称',
   subscribe_time       datetime comment '会员订阅时间',
   send_time            datetime comment '发送时间',
   primary key (id)
);

-- 优惠券表 
-- 用于存储优惠券信息，需要注意的是优惠券的使用类型：0->全场通用；1->指定分类；2->指定商品，不同使用类型的优惠券使用范围不一样。
create table sms_coupon
(
   id                   bigint not null auto_increment,
   type                 int(1) comment '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
   name                 varchar(100) comment '名称',
   platform             int(1) comment '使用平台：0->全部；1->移动；2->PC',
   count                int comment '数量',
   amount               decimal(10,2) comment '金额',
   per_limit            int comment '每人限领张数',
   min_point            decimal(10,2) comment '使用门槛；0表示无门槛',
   start_time           datetime comment '开始使用时间',
   end_time             datetime comment '结束使用时间',
   use_type             int(1) comment '使用类型：0->全场通用；1->指定分类；2->指定商品',
   note                 varchar(200) comment '备注',
   publish_count        int comment '发行数量',
   use_count            int comment '已使用数量',
   receive_count        int comment '领取数量',
   enable_time          datetime comment '可以领取的日期',
   code                 varchar(64) comment '优惠码',
   member_level         int(1) comment '可领取的会员类型：0->无限制',
   primary key (id)
);


-- 优惠券历史记录表
-- 用于存储会员领取及使用优惠券的记录，当会员领取到优惠券时，会产生一条优惠券的记录，需要注意的是它的使用状态：0->未使用；1->已使用；2->已过期。
create table sms_coupon_history
(
   id                   bigint not null auto_increment,
   coupon_id            bigint comment '优惠券id',
   member_id            bigint comment '会员id',
   order_id             bigint comment '订单id',
   coupon_code          varchar(64) comment '优惠券码',
   member_nickname      varchar(64) comment '领取人昵称',
   get_type             int(1) comment '获取类型：0->后台赠送；1->主动获取',
   create_time          datetime comment '创建时间',
   use_status           int(1) comment '使用状态：0->未使用；1->已使用；2->已过期',
   use_time             datetime comment '使用时间',
   order_sn             varchar(100) comment '订单号码',
   primary key (id)
);

-- 优惠券和商品的关系表
-- 用于存储优惠券与商品的关系，当优惠券的使用类型为指定商品时，优惠券与商品需要建立关系。
create table sms_coupon_product_relation
(
   id                   bigint not null auto_increment,
   coupon_id            bigint comment '优惠券id',
   product_id           bigint comment '商品id',
   product_name         varchar(500) comment '商品名称',
   product_sn           varchar(200) comment '商品条码',
   primary key (id)
);

-- 优惠券和商品分类关系表
-- 用于存储优惠券与商品分类的关系，当优惠券的使用类型为指定分类时，优惠券与商品分类需要建立关系。
create table sms_coupon_product_category_relation
(
   id                   bigint not null auto_increment,
   coupon_id            bigint comment '优惠券id',
   product_category_id  bigint comment '商品分类id',
   product_category_name varchar(200) comment '商品分类名称',
   parent_category_name varchar(200) comment '父分类名称',
   primary key (id)
);

-- 首页品牌推荐表 用于管理首页显示的品牌制造商直供信息。
create table sms_home_brand
(
   id                   bigint not null auto_increment,
   brand_id             bigint comment '商品品牌id',
   brand_name           varchar(64) comment '商品品牌名称',
   recommend_status     int(1) comment '推荐状态：0->不推荐;1->推荐',
   sort                 int comment '排序',
   primary key (id)
);

-- 新品推荐商品表 用于管理首页显示的新鲜好物信息。
create table sms_home_new_product
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   product_name         varchar(64) comment '商品名称',
   recommend_status     int(1) comment '推荐状态：0->不推荐;1->推荐',
   sort                 int(1) comment '排序',
   primary key (id)
);

-- 人气推荐商品表  用于管理首页显示的人气推荐信息。
create table sms_home_recommend_product
(
   id                   bigint not null auto_increment,
   product_id           bigint,
   product_name         varchar(64),
   recommend_status     int(1),
   sort                 int(1),
   primary key (id)
);
-- 首页专题推荐表 用于管理首页显示的专题精选信息。
create table sms_home_recommend_subject
(
   id                   bigint not null auto_increment,
   subject_id           bigint comment '专题id',
   subject_name         varchar(64) comment '专题名称',
   recommend_status     int(1) comment '推荐状态：0->不推荐;1->推荐',
   sort                 int comment '排序',
   primary key (id)
);
-- 首页轮播广告表 用于管理首页显示的轮播广告信息。
create table sms_home_advertise
(
   id                   bigint not null auto_increment,
   name                 varchar(100) comment '名称',
   type                 int(1) comment '轮播位置：0->PC首页轮播；1->app首页轮播',
   pic                  varchar(500) comment '图片地址',
   start_time           datetime comment '开始时间',
   end_time             datetime comment '结束时间',
   status               int(1) comment '上下线状态：0->下线；1->上线',
   click_count          int comment '点击数',
   order_count          int comment '下单数',
   url                  varchar(500) comment '链接地址',
   note                 varchar(500) comment '备注',
   sort                 int default 0 comment '排序',
   primary key (id)
);












