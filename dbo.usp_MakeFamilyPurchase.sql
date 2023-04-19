DROP PROCEDURE dbo.MakeFamilyPurchase 
CREATE PROCEDURE dbo.MakeFamilyPurchase (@FamilySurName varchar(255))
AS
BEGIN
DECLARE @sumbasketvalue money
   select @sumbasketvalue =
   sum(Basket.Value)
	from dbo.Family
	inner join 
	dbo.Basket
	on Family.id = basket.ID_family
	where family.surname = @FamilySurName
if @FamilySurName in (select surname from dbo.Family)
    update dbo.Family
	SET BudgetValue = @sumbasketvalue
	 where family.surname = @FamilySurName;
else print 'No such family'   
END;

