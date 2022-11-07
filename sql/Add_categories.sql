use Home_accountant;

insert into t_Categories (Category)
values (
    N'Продукты питания'
);

insert into t_Categories (Category)
values (
    N'Напитки'
);

insert into t_Categories (Category)
values (
    N'Бытовые товары'
);

select Category as 'Категория товаров' from t_Categories;