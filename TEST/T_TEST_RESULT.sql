﻿CREATE TABLE [TEST].[T_TEST_RESULT]
(
	[ID] BIGINT NOT NULL PRIMARY KEY IDENTITY, 
    [TRACK_NAME] NVARCHAR(50) NOT NULL, 
    [TIME] INT NULL,
    [START_TIME] INT NULL,
    [CREATED_USER] NVARCHAR(255) NOT NULL DEFAULT USER_NAME(), 
    [CREATED_TIME] DATETIME2 NOT NULL DEFAULT GETDATE()
)
