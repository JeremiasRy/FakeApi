CREATE TABLE [dbo].[product_image]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [ProductId] INT NOT NULL, 
    [Url] NVARCHAR(50) NOT NULL

    CONSTRAINT FK_product FOREIGN KEY (ProductId) REFERENCES [dbo].[product] ([Id])
)
