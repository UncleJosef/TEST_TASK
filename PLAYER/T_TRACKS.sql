CREATE TABLE [PLAYER].[T_TRACKS]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [NUMBER] NCHAR(10) NOT NULL,
    [TIME] INT NOT NULL, 
    [NAME] NVARCHAR(50) NOT NULL, 
    [CREATED_USER] NVARCHAR(255) NOT NULL DEFAULT USER_NAME(), 
    [CREATED_TIME] DATETIME2 NOT NULL DEFAULT GETDATE(),
    [CHANGED_USER] NVARCHAR(255) NOT NULL DEFAULT USER_NAME(), 
    [CHANGED_TIME] DATETIME2 NOT NULL DEFAULT GETDATE()
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Название трека',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACKS',
    @level2type = N'COLUMN',
    @level2name = N'NAME'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Время звучания трека',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACKS',
    @level2type = N'COLUMN',
    @level2name = N'TIME'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Номер трека',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACKS',
    @level2type = N'COLUMN',
    @level2name = N'NUMBER'