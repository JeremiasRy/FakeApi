CREATE PROCEDURE [dbo].[sp_insertproductimage]
	@ProductId int,
	@Url nvarchar(50)
AS
	INSERT INTO [dbo].product_image VALUES (@ProductId, @Url)
RETURN 0
