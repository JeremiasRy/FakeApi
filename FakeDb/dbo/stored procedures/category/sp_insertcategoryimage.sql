CREATE PROCEDURE [dbo].[sp_insertcategoryimage]
	@CategoryId int,
	@Url nvarchar(50)
AS
	INSERT INTO [dbo].[category_image] VALUES (@CategoryId, @Url)
RETURN 0
