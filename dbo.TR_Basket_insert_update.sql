drop  TRIGGER dbo.TR_Basket_insert_update
CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket 
INSTEAD OF INSERT 
AS
INSERT INTO  dbo.Basket 
(id_sku, 
id_family,
quantity, 
"Value",
 PurchaseDate,
 DiscountValue)
select
c.id_sku, 
id_family,
quantity, 
"Value",
 PurchaseDate,
cast(case when c.sku_count >=2
     then "Value" *0.05
	 else 0 end as decimal(18, 4))DiscountValue
FROM inserted i
inner join 
(select id_SKU, 
COUNT(*) SKU_COUNT
from inserted
group by id_sku)c
on i.id_sku = c.id_sku;
