create table country(
	id serial primary key,
	country_name varchar(30) not null
)

create table state(
	id serial primary key,
	state_name varchar(30) not null,
	country_id int not null,
	constraint FK_state_country foreign key (country_id)
		references country(id)
)

create table street (
	id serial primary key,
	street_name varchar(100) not null,
	state_id int not null,
	constraint FK_street_state foreign key (state_id)
		references state(id)
)


create table house(
	house_number varchar(10) not null,
	street_id int not null,
	postalcode int not null,
	constraint FK_house_street foreign key (street_id)
		references street(id),
	constraint PK_house primary key (street_id, house_number)
)

create table job_title(
	id serial primary key,
	job_name varchar(20) not null
)

create table wealth_segment(
	id serial primary key,
	segment_name varchar(20) not null
)

create table industry(
	id serial primary key,
	industry_name varchar(20) not null
)

create table gender(
	id serial primary key,
	gender_name varchar(10) not null
)

create table customer(
	id serial primary key,
	last_name varchar(20),
	first_name varchar(20) not null,
	gender_id int,
	birth date,
	job_id int,
	industry_id int,
	segment_id int,
	has_car bool,
	is_deseased bool,
	house_number char(10),
	street_id int,
	product_value int,
	constraint FK_customer_address foreign key (house_number, street_id)
		references house(house_number, street_id),
	constraint FK_customer_gender foreign key (gender_id)
		references gender(id),
	constraint FK_customer_job foreign key (job_id)
		references job_title(id),
	constraint FK_customer_industry foreign key (industry_id)
		references industry(id),
	constraint FK_customer_segment foreign key (segment_id)
		references wealth_segment(id)
)

create table brand(
	id serial primary key,
	brand_name varchar(20)
)

create table line_type(
	id serial primary key,
	line_name varchar(20)
)

create table class_type(
	id serial primary key,
	class_name varchar(20)
)

create table size_type(
	id serial primary key,
	size_name varchar(20)
)

create table product(
	id serial primary key,
	brand_id int,
	line_id int,
	class_id int,
	size_id int,
	list_price money,
	standard_price money,
	constraint FK_product_brand foreign key (brand_id)
		references brand(id),
	constraint FK_product_line foreign key (line_id)
		references line_type(id),
	constraint FK_product_class foreign key (class_id)
		references class_type(id),
	constraint FK_product_size foreign key (size_id)
		references size_type(id)
)

create table transaction_status(
	id serial primary key,
	status_name varchar(15)
) 

create table transaction(
	id serial primary key,
	product_id int not null,
	customer_id int not null,
	transaction_date date not null,
	status_id int,
	is_online bool,
	constraint FK_transaction_product foreign key (product_id)
		references product(id),
	constraint FK_transaction_customer foreign key (customer_id)
		references customer(id),
	constraint FK_transaction_status foreign key (status_id)
		references transaction_status(id)
)