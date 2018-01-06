create table mmall_user(
	id int(11) not null auto_increment comment '用户表id',
	username varchar(50) not null comment '用户名',
	password varchar(50) not null comment '用户密码',
	email varchar(50) default null,
	phone varchar(20) default null,
	question varchar(100) default null comment '找回密码问题',
	answer varchar(100) default null comment '找回密码答案',
	role tinyint(4) not null comment '用户角色 0管理员 1普通用户',
	create_time datetime not null comment '创建时间',
	update_time datetime not null comment '最后一次登录时间',
	primary key(id),
	unique key username_unique(username) using btree
)engine=InnoDB auto_increment=21 default charset=utf8 comment '用户表';


create table mmall_category(
	id int(11) not null auto_increment comment '类别id',
	parent_id int (11) default null comment '父类别id当id=0为1级类别',
	name varchar(50) default null comment '类别名称',
	status tinyint(1) default '1' comment '类别状态 1正常 2废弃',
	sort_order int(4) default null comment '排序编号，同级类展示顺序，数值相等自然排序',
	create_time datetime default null comment '创建时间',
	update_time datetime default null comment '更新时间',
	primary key(id)
)engine=InnoDB auto_increment=100032 default charset=utf8 comment '类别表';


create table mmall_product(
	id int(11) not null auto_increment comment '商品id',
	category_id int(11) not null comment '分类id，对应mmall_category表主键',
	name varchar(100) not null comment '商品名称',
	subtitle varchar(200) default null comment '商品副标题',
	main_image varchar(500) default null comment '产品主图，url相对地址',
	sub_images text comment '图片地址，json格式，拓展用',
	detail text comment '商品详情',
	price decimal(20,2) not null comment '价格',
	stock int(11) not null comment '库存数量',
	status int(6) default '1' comment '商品状态 1在售 2下架 3删除',
	create_time datetime default null comment '创建时间',
	update_time datetime default null comment '更新时间',
	primary key(id)
)engine=InnoDB auto_increment=26 default charset=utf8 comment '产品表';


create table mmall_cart(
	id int(11) not null auto_increment,
	user_id int(11) default null comment '用户id',
	product_id int(11) default null comment '商品id',
	quantity int(11) default null comment '数量',
	checked int(11) default null comment '是否选择 1已勾选 0未勾选',
	create_time datetime default null comment '创建时间',
	update_tome datetime default null comment '更新时间',
	primary key(id),
	key user_id_index(user_id) using btree
)engine=InnoDB auto_increment=121 default charset=utf8 comment '购物车表';



create table mmall_pay_info(
	id int(11) not null auto_increment,
	user_id int(11) default null comment '用户id',
	order_no bigint(20) default null comment '订单号',
	pay_platform int(10) default null comment '支付平台 1支付宝 2微信',
	platform_number varchar(200) default null comment '支付宝支付流水号',
	platform_status varchar(20) default null comment '支付宝支付状态',
	create_time datetime default null comment '创建时间',
	update_time datetime default null comment '更新时间',
	primary key(id)
)engine=InnoDB auto_increment=53 default charset=utf8 comment '支付信息表';



create table mmall_order(
	id int(11) not null auto_increment,
	order_no bigint(20) default null comment '订单号',
	user_id int(11) default null comment '用户id',
	shipping_id int(11) default null comment '地址id',
	payment decimal(20,2) default null comment '实际付款金额',
	payment_type int(4) default null comment '支付类型 1在线支付',
	postage int(10) default null comment '运费',
	status int(10) default null comment '订单状态，0取消，10付款，20已付款，40已发货，50交易成功，60交易关闭',
	payment_time datetime default null comment '支付时间',
	send_time datetime default null comment '发货时间',
	end_time datetime default null comment '交易完成时间',
	close_time datetime default null comment '交易关闭时间',
	create_time datetime default null comment '创建时间',
	update_time datetime default null comment '更新时间',
	primary key(id),
	unique key order_no_index(order_no) using btree
)engine=InnoDB auto_increment=103 default charset=utf8 comment '订单表';



create table mmall_order_item(
	id int(11) not null auto_increment,
	order_no bigint(20) default null,
	user_id int(11) default null,
	product_id int(11) default null comment '商品id',
	product_name varchar(100) default null comment '商品名称',
	product_image varchar(500) default null comment '商品图片地址',
	current_unit_price decimal(20,2) default null comment '生成订单时的商品单价',
	quantity int(10) default null comment '商品数量',
	total_price decimal(20,2) default null comment '商品总价',
	create_time datetime default null comment '创建时间',
	update_time datetime default null comment '更新时间',
	primary key(id),
	key order_no_index(order_no) using btree,
	key order_no_user_id_index(user_id,order_no) using btree
)engine=InnoDB auto_increment=113 default charset=utf8 comment '订单明细表';


create table mmall_shipping(
	id int(11) not null auto_increment,
	user_id int(11) default null,
	receiver_name varchar(20) default null comment '姓名',
	receiver_phone varchar(20) default null comment '固定电话',
	receiver_mobile varchar(20) default null comment '移动电话',
	receiver_province varchar(20) default null comment '省份',
	receiver_city varchar(20) default null comment '城市',
	receiver_district varchar(20) default null comment '区/县',
	receiver_address varchar(200) default null comment '详细地址',
	receiver_zip varchar(6) default null comment '邮编',
	create_time datetime default null,
	update_time datetime default null,
	primary key(id)
)engine=InnoDB auto_increment=32 default charset=utf8 comment '收获地址表';