CREATE TABLE [dbo].[product]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Title] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(50) NULL, 
    [Price] NVARCHAR(50) NOT NULL, 
    [CategoryId] INT NOT NULL, 

    CONSTRAINT FK_category FOREIGN KEY (CategoryId) REFERENCES [dbo].[category] ([id])
)
