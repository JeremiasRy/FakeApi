CREATE PROCEDURE [dbo].[sp_insertcategory]
	@Title nvarchar(50)
AS
	INSERT INTO [dbo].[category] VALUES (@Title)
RETURN 0
