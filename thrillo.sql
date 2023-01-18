create table users (
  user_id bigint(20) NOT NULL primary key,
  username varchar(255) NOT NULL,
  user_email varchar(255) NOT NULL,
  user_password varchar(255) NOT NULL,
  user_phonne int(10) NOT NULL
);

create table product_types (
  product_type_id bigint(20) NOT NULL primary key,
);

create table product_types_activity (
  activity_id bigint(20) NOT NULL primary key,
  product_type_id bigint(20) NOT NULL references product_types(product_type_id),
  activity_name varchar(255) NOT NULL,
  activity_location varchar(255) NOT NULL,
  activity_price float NOT NULL
);

create table product_types_tours (
  tour_id int(10) unsigned NOT NULL primary key,
  product_type_id bigint(20) NOT NULL references product_types(product_type_id),
  tour_location varchar(255) NOT NULL,
  tour_duration float NOT NULL,
  tour_price float NOT NULL,
  tour_description varchar(255) NOT NULL
);

create table product_types_rentals (
  rental_id int(10) unsigned NOT NULL primary key,
  product_type_id bigint(20) NOT NULL references product_types(product_type_id),
  vehicle_type varchar(50) NOT NULL,
  rental_location varchar(50) NOT NULL,
  rental_price float NOT NULL
);

create table product_types_staycations (
  staycations_id int(10) unsigned NOT NULL primary key,
  product_type_id bigint(20) NOT NULL references product_types(product_type_id),
  property_name varchar(255) NOT NULL,
  property_type varchar(255) NOT NULL,
  property_rate float NOT NULL
);

create table bookings (
  booking_id bigint(20) unsigned NOT NULL primary key,
  product_type_id bigint(20) NOT NULL references product_types(product_type_id),
  user_id bigint(20) unsigned NOT NULL references users(user_id),
  booking_date date NOT NULL
);

create table payments (
  payment_id bigint(20) unsigned NOT NULL primary key,
  user_id bigint(20) unsigned NOT NULL references users(user_id),
  product_type_id bigint(20) unsigned NOT NULL references product_types(product_type_id),
  payment_date date NOT NULL
);

create table cancellations (
  cancellation_id bigint(20) unsigned NOT NULL primary key,
  product_type_id bigint(20) unsigned NOT NULL references product_types(product_type_id),
  user_id bigint(20) unsigned NOT NULL references users(user_id),
  paid boolean NOT NULL,
  booking_id bigint(20) unsigned NOT NULL references bookings(booking_id),
  cancellation_date date NOT NULL
);

create table refunds (
  refund_id bigint(20) unsigned NOT NULL primary key,
  user_id bigint(20) unsigned NOT NULL references users(user_id),
  product_type_id bigint(20) unsigned NOT NULL references product_types(product_type_id),
  refund_amount float NOT NULL
);

create table reviews (
  review_id bigint(20) unsigned NOT NULL primary key,
  product_type_id bigint(20) unsigned NOT NULL references product_types(product_type_id),
  user_id bigint(20) unsigned NOT NULL references users(user_id),
  rating int NOT NULL,
  review varchar(255)
);