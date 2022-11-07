select
    sp.Name 'Магазин',
    format(rec.date, 'dd\.MM\.yy') 'Дата',
    format(rec.time, 'hh\:mm') 'Время',
    rec.Total_price 'Итог',
    tp.Type 'Тип оплаты'
from
    t_Sell_point_names sp

inner join t_Receipts rec on rec.Store = sp.ID
inner join t_Types_of_payment tp on rec.Type_of_payment = tp.ID;