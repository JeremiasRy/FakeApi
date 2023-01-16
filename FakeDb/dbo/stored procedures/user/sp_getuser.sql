CREATE PROCEDURE [dbo].[sp_getuser]
	@Email nvarchar(50) = null,
	@Id int = null
AS
BEGIN
	SELECT * 
	FROM [dbo].[user] 
	WHERE 
	(1=(CASE when @Email is null THEN 1 else 0 end) or Email = @Email) and
	(1=(CASE when @Id is null THEN 1 else 0 end) or Id = @Id)
END
GO
