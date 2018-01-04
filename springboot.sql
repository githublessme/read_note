create table product_info(
	product_id varchar(32) not null comment '��ƷId',
	product_name varchar(64) not null comment '��Ʒ����',
	product_price decimal(8,2) not null comment '����',
	product_stock int not null comment '���',
	product_description varchar(64) comment '����',
	product_icon varchar(512) comment 'Сͼ',
	category_type int not null comment '��Ŀ���',
	create_time timestamp not null default current_timestamp comment '����ʱ��',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '����ʱ��',
	primary key(product_id)
)engine=InnoDB default charset=utf8 comment '��Ʒ��';

create table product_category(
	category_id int not null auto_increment comment '��ĿId',
	category_name varchar(64) not null comment '��Ŀ����',
	category_type int not null comment '��Ŀ���',
	create_time timestamp not null default current_timestamp comment '����ʱ��',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '����ʱ��',
	primary key(category_id),
	unique key `uqe_category_type` (category_type)
)engine=InnoDB default charset=utf8 comment '��Ʒ��Ŀ��';

create table order_master(
	order_id varchar(32) not null,
	buyer_name varchar(32) not null comment '�������',
	buyer_phone varchar(32) not null comment '��ҵ绰',
	buyer_address varchar(128) not null comment '��ҵ�ַ',
	buyer_openid varchar(64) not null comment '���΢��openid',
	order_amount decimal(8,2) not null comment '�����ܽ��',
	order_status tinyint(3) not null default 0 comment '����״̬,Ĭ�����µ�0',
	pay_status tinyint(3) not null default 0 comment '֧��״̬��Ĭ��δ֧��0',
	create_time timestamp not null default current_timestamp comment '����ʱ��',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '����ʱ��',
	primary key(order_id),
	key `idx_buyer_openid` (buyer_openid)
)engine=InnoDB default charset=utf8 comment '��������';

create table order_detail(
	detail_id varchar(32) not null,
	order_id varchar(32) not null,
	product_id varchar(32) not null,
	product_name varchar(64) not null comment '��Ʒ����',
	product_price decimal(8,2) not null comment '��Ʒ�۸�',
	product_quantity int not null comment '��Ʒ����',
	product_icon varchar(512) comment '��ƷͼƬ',
	create_time timestamp not null default current_timestamp comment '����ʱ��',
	update_time timestamp not null default current_timestamp on update current_timestamp comment '����ʱ��',
	primary key (detail_id),
	key `idx_order_id`(order_id)
)engine=InnoDB default charset=utf8 comment '���������';