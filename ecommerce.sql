create table customer (
 customer_id bigint primary key,
 customer_name varchar(255) NOT NULL,
 customer_phone int,
 customer_email varchar(255),
 customer_googleAuth varchar(255) 
);

create table products (
  product_id int(10) unsigned NOT NULL primary key,
  category_id int(10) unsigned NOT NULL,
  product_name varchar(255) NOT NULL
  product_description varchar(255) NOT NULL
);

create table categories (
  categories_id int(10) unsigned NOT NULL primary key,
  product_id int(10) unsigned NOT NULL references products(product_id),
  category_name varchar(255) NOT NULL,
  category_description varchar(255) NOT NULL,
  category_type varchar(255) NOT NULL
);

create table address (
  address_id bigint(20) unsigned NOT NULL primary key,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  full_address varchar(255) NOT NULL,
  pin int NOT NULL
);

create table wishlist (
  id bigint(20) unsigned NOT NULL primary key,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  product_id bigint(20) unsigned NOT NULL
);

create table order (
  order_id bigint(20) unsigned NOT NULL primary key,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  order_date date NOT NULL
);

create table shipments (
  shipment_id bigint(20) unsigned NOT NULL primary key,
  order_id bigint(20) unsigned NOT NULL references order(order_id),
  shipment_date date NOT NULL,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  address_id bigint(20) unsigned NOT NULL references address(address_id)
);

create table transaction (
  transaction_id bigint(20) unsigned NOT NULL primary key,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  order_id bigint(20) unsigned NOT NULL references order(order_id),
  product_id bigint(20) unsigned NOT NULL references product(product_id),
  transaction_date date NOT NULL
);

create table offers (
  offer_id bigint(20) unsigned NOT NULL primary key,
  product_id bigint(20) unsigned NOT NULL references product(product_id),
  offer_description text NOT NULL,
  daily_offer varchar(255) 
);

create table admin (
  admin_id bigint(20) unsigned NOT NULL primary key,
  customer_id bigint(20) unsigned NOT NULL references customer(customer_id),
  product_id bigint(20) unsigned NOT NULL references product(product_id),
  order_id bigint(20) unsigned NOT NULL references order(order_id),
  shipment_id bigint(20) unsigned NOT NULL references shipments(shipment_id)
);