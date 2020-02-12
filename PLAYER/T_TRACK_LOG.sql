CREATE TABLE [PLAYER].[T_TRACK_LOG]
(
	[ID] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [OPERATION_TYPE_ID] BIGINT NOT NULL,
    [TRACK_ID] BIGINT NOT NULL,
    [CONTENT] NVARCHAR(255) NOT NULL,
    [CREATED_USER] NVARCHAR(255) NOT NULL DEFAULT USER_NAME(), 
    [CREATED_TIME] DATETIME2 NOT NULL DEFAULT GETDATE()
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Тип операции',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACK_LOG',
    @level2type = N'COLUMN',
    @level2name = 'OPERATION_TYPE_ID'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Содержание операции',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACK_LOG',
    @level2type = N'COLUMN',
    @level2name = N'CONTENT'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Пользователь, выполнивший операцию',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACK_LOG',
    @level2type = N'COLUMN',
    @level2name = N'CREATED_USER'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Дата выполнения операции',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACK_LOG',
    @level2type = N'COLUMN',
    @level2name = N'CREATED_TIME'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'ID Трека',
    @level0type = N'SCHEMA',
    @level0name = N'PLAYER',
    @level1type = N'TABLE',
    @level1name = N'T_TRACK_LOG',
    @level2type = N'COLUMN',
    @level2name = N'TRACK_ID'