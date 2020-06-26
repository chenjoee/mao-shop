-- 商品分类表
create table pms_product_category
(
   id                   bigint not null auto_increment,
   parent_id            bigint comment '上级分类的编号：0表示一级分类',
   name                 varchar(64) comment '名称',
   level                int(1) comment '分类级别：0->1级；1->2级',
   product_count        int comment '商品数量',
   product_unit         varchar(64) comment '商品单位',
   nav_status           int(1) comment '是否显示在导航栏：0->不显示；1->显示',
   show_statuspms_comment          int(1) comment '显示状态：0->不显示；1->显示',
   sort                 int comment '排序',
   icon                 varchar(255) comment '图标',
   keywords             varchar(255) comment '关键字',
   description          text comment '描述',
   primary key (id)
);

-- 商品品牌表
create table pms_brand
(
   id                   bigint not null auto_increment,
   name                 varchar(64) comment '名称',
   first_letter         varchar(8) comment '首字母',
   sort                 int comment '排序',
   factory_status       int(1) comment '是否为品牌制造商：0->不是；1->是',
   show_status          int(1) comment '是否显示',
   product_count        int comment '产品数量',
   product_comment_count int comment '产品评论数量',
   logo                 varchar(255) comment '品牌logo',
   big_pic              varchar(255) comment '专区大图',
   brand_story          text comment '品牌故事',
   primary key (id)
);

-- 商品属性分类表
create table pms_product_attribute_category
(
   id                   bigint not null auto_increment,
   name                 varchar(64) comment '名称',
   attribute_count      int comment '属性数量',
   param_count          int comment '参数数量',
   primary key (id)
);

-- 商品属性表
create table pms_product_attribute
(
   id                   bigint not null auto_increment,
   product_attribute_category_id bigint comment '商品属性分类id',
   name                 varchar(64) comment '名称',
   select_type          int(1) comment '属性选择类型：0->唯一；1->单选；2->多选；对应属性和参数意义不同；',
   input_type           int(1) comment '属性录入方式：0->手工录入；1->从列表中选取',
   input_list           varchar(255) comment '可选值列表，以逗号隔开',
   sort                 int comment '排序字段：最高的可以单独上传图片',
   filter_type          int(1) comment '分类筛选样式：1->普通；1->颜色',
   search_type          int(1) comment '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
   related_status       int(1) comment '相同属性产品是否关联；0->不关联；1->关联',
   hand_add_status      int(1) comment '是否支持手动新增；0->不支持；1->支持',
   type                 int(1) comment '属性的类型；0->规格；1->参数',
   primary key (id)
);

-- 商品属性值表
-- 如果对应的参数是规格且规格支持手动添加，那么该表用于存储手动新增的值；如果对应的商品属性是参数，那么该表用于存储参数的值。
create table pms_product_attribute_value
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   product_attribute_id bigint comment '商品属性id',
   value                varchar(64) comment '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
   primary key (id)
);

create table pms_product_category_attribute_relation
(
   id                   bigint not null auto_increment,
   product_category_id  bigint comment '商品分类id',
   product_attribute_id bigint comment '商品属性id',
   primary key (id)
);

create table pms_product
(
   id                   bigint not null auto_increment,
   brand_id             bigint comment '品牌id',
   product_category_id  bigint comment '品牌分类id',
   feight_template_id   bigint comment '运费模版id',
   product_attribute_category_id bigint comment '品牌属性分类id',
   name                 varchar(64) not null comment '商品名称',
   pic                  varchar(255) comment '图片',
   product_sn           varchar(64) not null comment '货号',
   delete_status        int(1) comment '删除状态：0->未删除；1->已删除',
   publish_status       int(1) comment '上架状态：0->下架；1->上架',
   new_status           int(1) comment '新品状态:0->不是新品；1->新品',
   recommand_status     int(1) comment '推荐状态；0->不推荐；1->推荐',
   verify_status        int(1) comment '审核状态：0->未审核；1->审核通过',
   sort                 int comment '排序',
   sale                 int comment '销量',
   price                decimal(10,2) comment '价格',
   promotion_price      decimal(10,2) comment '促销价格',
   gift_growth          int default 0 comment '赠送的成长值',
   gift_point           int default 0 comment '赠送的积分',
   use_point_limit      int comment '限制使用的积分数',
   sub_title            varchar(255) comment '副标题',
   description          text comment '商品描述',
   original_price       decimal(10,2) comment '市场价',
   stock                int comment '库存',
   low_stock            int comment '库存预警值',
   unit                 varchar(16) comment '单位',
   weight               decimal(10,2) comment '商品重量，默认为克',
   preview_status       int(1) comment '是否为预告商品：0->不是；1->是',
   service_ids          varchar(64) comment '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
   keywords             varchar(255) comment '关键字',
   note                 varchar(255) comment '备注',
   album_pics           varchar(255) comment '画册图片，连产品图片限制为5张，以逗号分割',
   detail_title         varchar(255) comment '详情标题',
   detail_desc          text comment '详情描述',
   detail_html          text comment '产品详情网页内容',
   detail_mobile_html   text comment '移动端网页详情',
   promotion_start_time datetime comment '促销开始时间',
   promotion_end_time   datetime comment '促销结束时间',
   promotion_per_limit  int comment '活动限购数量',
   promotion_type       int(1) comment '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
   product_category_name varchar(255) comment '产品分类名称',
   brand_name           varchar(255) comment '品牌名称',
   primary key (id)
);


create table pms_sku_stock
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   sku_code             varchar(64) not null comment 'sku编码',
   price                decimal(10,2) comment '价格',
   stock                int default 0 comment '库存',
   low_stock            int comment '预警库存',
   sp1                  varchar(64) comment '规格属性1',
   sp2                  varchar(64) comment '规格属性2',
   sp3                  varchar(64) comment '规格属性3',
   pic                  varchar(255) comment '展示图片',
   sale                 int comment '销量',
   promotion_price      decimal(10,2) comment '单品促销价格',
   lock_stock           int default 0 comment '锁定库存',
   primary key (id)
);

create table pms_product_ladder
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   count                int comment '满足的商品数量',
   discount             decimal(10,2) comment '折扣',
   price                decimal(10,2) comment '折后价格',
   primary key (id)
);

create table pms_product_full_reduction
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   full_price           decimal(10,2) comment '商品满足金额',
   reduce_price         decimal(10,2) comment '商品减少金额',
   primary key (id)
);


create table pms_member_price
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   member_level_id      bigint comment '会员等级id',
   member_price         decimal(10,2) comment '会员价格',
   member_level_name    varchar(100) comment '会员等级名称',
   primary key (id)
);

create table pms_comment
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   member_nick_name     varchar(255) comment '会员昵称',
   product_name         varchar(255) comment '商品名称',
   star                 int(3) comment '评价星数：0->5',
   member_ip            varchar(64) comment '评价的ip',
   create_time          datetime comment '创建时间',
   show_status          int(1) comment '是否显示',
   product_attribute    varchar(255) comment '购买时的商品属性',
   collect_couont       int comment '收藏数',
   read_count           int comment '阅读数',
   content              text comment '内容',
   pics                 varchar(1000) comment '上传图片地址，以逗号隔开',
   member_icon          varchar(255) comment '评论用户头像',
   replay_count         int comment '回复数',
   primary key (id)
);

create table pms_comment_replay
(
   id                   bigint not null auto_increment,
   comment_id           bigint comment '评论id',
   member_nick_name     varchar(255) comment '会员昵称',
   member_icon          varchar(255) comment '会员头像',
   content              varchar(1000) comment '内容',
   create_time          datetime comment '创建时间',
   type                 int(1) comment '评论人员类型；0->会员；1->管理员',
   primary key (id)
);

create table pms_product_vertify_record
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   create_time          datetime comment '创建时间',
   vertify_man          varchar(64) comment '审核人',
   status               int(1) comment '审核后的状态：0->未通过；2->已通过',
   detail               varchar(255) comment '反馈详情',
   primary key (id)
);

create table pms_product_operate_log
(
   id                   bigint not null auto_increment,
   product_id           bigint comment '商品id',
   price_old            decimal(10,2) comment '改变前价格',
   price_new            decimal(10,2) comment '改变后价格',
   sale_price_old       decimal(10,2) comment '改变前优惠价',
   sale_price_new       decimal(10,2) comment '改变后优惠价',
   gift_point_old       int comment '改变前积分',
   gift_point_new       int comment '改变后积分',
   use_point_limit_old  int comment '改变前积分使用限制',
   use_point_limit_new  int comment '改变后积分使用限制',
   operate_man          varchar(64) comment '操作人',
   create_time          datetime comment '创建时间',
   primary key (id)
);


