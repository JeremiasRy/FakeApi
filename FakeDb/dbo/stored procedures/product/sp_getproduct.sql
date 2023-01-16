CREATE PROCEDURE [dbo].[sp_getproduct]
	@Id int
AS
	SELECT [dbo].product.Id, [dbo].product.Title, [dbo].product.Description, [dbo].product.Price, [dbo].product_image.Url FROM [dbo].product
	INNER JOIN [dbo].product_image ON [dbo].product.Id = [dbo].product_image.ProductId
	WHERE @Id = [dbo].product.Id
RETURN 0
