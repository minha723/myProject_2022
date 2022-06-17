create table client_table(
                             id bigint auto_increment,
                             clientId varchar(30) unique not null,
                             clientPassword varchar(30) not null,
                             clientName varchar(20) not null,
                             clientEmail varchar(50),
                             clientMobile varchar(20),
                             clientPoint bigint default 0,
                             clientKakaoId varchar(30),

                             constraint pk_client_table primary key (id)
);

create table vendor_table(
                             id bigint auto_increment,
                             vendorId varchar(30) unique not null,
                             vendorPassword varchar(30) not null,
                             vendorName varchar(20) not null,
                             vendorEmail varchar(50),
                             vendorMobile varchar(20) not null,
                             vendorPoint bigint default 0,
                             vendorFileName varchar(50),

                             constraint pk_vendor_table primary key (id)
);


create table product_table(
                              id bigint auto_increment,
                              vendorId varchar(30) not null,
                              productName varchar(30) not null,
                              productDesc varchar(500) not null,
                              productFileName varchar(50),
                              productPrice bigint not null,
                              productStar double default 0,
                              productApproval int default 0 not null,
                              productCategory int default 0,

                              constraint pk_product_table primary key (id),
                              constraint fk_product_table_vendorId foreign key(vendorId) references vendor_table(vendorId) on delete cascade
);


create table history_table(
                              id bigint auto_increment,
                              vendorId varchar(30) not null,
                              clientId varchar(30) not null,
                              productId bigint not null,
                              productPrice bigint not null,
                              historyCreatedTime datetime,

                              constraint pk_history_table primary key (id),
                              constraint fk_history_table_vendorId foreign key(vendorId) references vendor_table(vendorId) on delete cascade,
                              constraint fk_history_table_clientId foreign key(clientId) references client_table(clientId) on delete cascade,
                              constraint fk_history_table_productId foreign key(productId) references product_table(id) on delete cascade
);

create table review_table(
                             id bigint auto_increment,
                             productId bigint not null,
                             clientId varchar(30) not null,
                             reviewContents varchar(300) not null,
                             reviewStar double not null,
                             reviewCreatedTime datetime,

                             constraint pk_review_table primary key (id),
                             constraint fk_review_table_clientId foreign key(clientId) references client_table(clientId) on delete cascade,
                             constraint fk_review_table_productId foreign key(productId) references product_table(id) on delete cascade
);

create table like_table(
                           id bigint auto_increment,
                           productId bigint not null,
                           clientId varchar(30) not null,

                           constraint pk_like_table primary key (id),
                           constraint fk_like_table_clientId foreign key(clientId) references client_table(clientId) on delete cascade,
                           constraint fk_like_table_productId foreign key(productId) references product_table(id) on delete cascade
);