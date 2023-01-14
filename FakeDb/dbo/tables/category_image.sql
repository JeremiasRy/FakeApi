CREATE TABLE [dbo].[category_image]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [CategoryId] INT NULL, 
    [Url] NVARCHAR(50) NULL,

    CONSTRAINT FK_CategoryImg FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[category] ([Id])
)
