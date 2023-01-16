CREATE PROCEDURE [dbo].[sp_insertuser]
	@Name nvarchar(50),
	@Email nvarchar(50),
	@Password nvarchar(100)
AS
	Insert into [dbo].[user]
	values (@Name, @Email, @Password)
RETURN 0
