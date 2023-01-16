CREATE PROCEDURE [dbo].[sp_insertproduct]
	@Title nvarchar(50),
	@Description nvarchar(50),
	@Price int,
	@CategoryId int
AS
	INSERT INTO [dbo].product VALUES (@Title, @Description, @Price, @CategoryId)
RETURN 0
