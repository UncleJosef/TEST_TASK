﻿CREATE TABLE [PLAYER].[T_OPERATION_TYPES]
(
	[ID] BIGINT NOT NULL PRIMARY KEY, 
    [NAME] NCHAR(10) NULL,
    [CREATED_USER] NVARCHAR(255) NOT NULL DEFAULT USER_NAME(), 
    [CREATED_TIME] DATETIME2 NOT NULL DEFAULT GETDATE()
)
