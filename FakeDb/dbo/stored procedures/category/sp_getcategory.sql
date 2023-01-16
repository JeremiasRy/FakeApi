CREATE PROCEDURE [dbo].[sp_getcategory]
	@Id int
AS
	SELECT [dbo].[category].Id, category.Title, [dbo].category_image.Url FROM [dbo].category
	INNER JOIN [dbo].category_image ON [dbo].category.Id = [dbo].category_image.CategoryId
	WHERE [dbo].category.Id = @id
RETURN 0
