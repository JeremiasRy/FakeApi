CREATE PROCEDURE [dbo].[sp_updateuser]
	@Id int,
	@Name nvarchar(50),
	@Email nvarchar(50),
	@Password nvarchar(100)
AS
	UPDATE [dbo].[user]
	SET Email = @Email, Name = @Name, Password = @Password
	where Id = @id
RETURN 0

