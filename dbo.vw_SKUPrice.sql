CREATE VIEW dbo.vw_SKUPrice AS
SELECT 
ID,
Code,
"Name", 
dbo.udf_GetSKUPrice(id) SKUPrice
from dbo.SKU

