/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO [dbo].category 
VALUES ('Shoes'), ('Clothes'), ('Others')
INSERT INTO [dbo].category_image 
VALUES(1, 'fake url 1'), (2, 'fake url 2'), (3, 'fake url 3')
INSERT INTO [dbo].product 
VALUES ('Nice shoes', 'Very good', 124, 1), ('Nice shirt', 'it''s all right', 156, 2), ('JAusers', 'something else', 666, 3)
INSERT INTO [dbo].product_image 
VALUES (1, 'Fake url 1 for product 1'), (1, 'Fake url 2 for product 1'), (1, 'Fake url 3 for product 1'), (2, 'Fake url for product 2'), (3, 'Fake url for product 3')
