use master
go

create database Home_accountant
go

use Home_accountant;

create table t_Addresses (
	ID		  tinyint	 not null identity(1,1),
	[Address] nchar(250) not null,

	constraint PK_Address_ID primary key clustered (ID)
);

create table t_Sell_point_names (
	ID     tinyint   not null identity(1,1),
	[Name] nchar(25) not null,

	constraint PK_Sell_point_name_ID primary key clustered (ID),
);

create table t_Stores (
	ID        int     not null identity(1,1),
	[Name]    tinyint not null,
	[Address] tinyint not null,

	constraint PK_Store_ID primary key clustered (ID),
	constraint FK_Store_name foreign key (Name)
		references t_Sell_point_names (ID),
	constraint FK_Store_address foreign key (Address)
		references t_Addresses (ID)
);

create table t_Categories (
	ID       tinyint   not null identity(1,1),
	Category nchar(25) not null,

	constraint PK_Category_ID primary key clustered (ID)
);

create table t_Types_of_payment (
	ID   bit       not null,
	Type nchar(15) not null,

	constraint PK_Type_of_payment primary key clustered (ID)
);

create table t_Receipts (
	ID              int     not null identity(1,1),
	[Date]          date    not null,
	[Time]          time(0) not null,
	Type_of_payment bit     not null,
	Store           int     not null,

	constraint Receipt_ID primary key clustered (ID),
	constraint FK_Type_of_payment foreign key (Type_of_payment) references t_Types_of_payment (ID),
	constraint FK_Store_ID foreign key (Store) references t_Stores (ID)
);

create table t_Products (
	ID          int          not null identity(1,1),
	Category    tinyint      not null,
	[Name]      nchar(250)   not null,
	Price       money        not null,
	Amount      decimal(7,3) not null,
	Total_price money        not null,
	Receipt     int          not null,

	constraint PK_Product_ID primary key clustered (ID),
	constraint FK_Category_ID foreign key (Category)
		references t_Categories (ID),
	constraint FK_Receipt_ID foreign key (receipt)
		references t_Receipts (ID)
);