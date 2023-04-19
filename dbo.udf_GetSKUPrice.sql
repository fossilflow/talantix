CREATE FUNCTION dbo.udf_GetSKUPrice
 (@ID_SKU int)
RETURNS DECIMAL(18, 2)
 BEGIN
  DECLARE @skuPrice DECIMAL(18, 2)
  SELECT @skuPrice = sum( "Value")/sum(quantity)
  FROM dbo.Basket
  WHERE id_sku=@ID_SKU
 RETURN @skuPrice
 END

  
