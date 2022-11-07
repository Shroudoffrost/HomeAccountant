use Home_accountant;

insert into t_Types_of_payment(ID, Type)
values (
    0,
	N'Наличные'
);

insert into t_Types_of_payment(ID, Type)
values (
    1,
	N'Карта'
);

select * from t_Types_of_payment;