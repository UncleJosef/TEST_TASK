﻿-- Создаем файловую группу
USE TEST_TASK;
GO

ALTER DATABASE TEST_TASK ADD FILEGROUP FG_TEST_TASK CONTAINS MEMORY_OPTIMIZED_DATA 
ALTER DATABASE TEST_TASK ADD FILE (name='FG_TEST_TASK1', filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\DATA\FG_TEST_TASK1') TO FILEGROUP FG_TEST_TASK     
GO

DROP TABLE IF EXISTS [PLAYER].[T_TRACK_COUNTER];

CREATE TABLE [PLAYER].[T_TRACK_COUNTER]
(
    [TRACK_ID] BIGINT NOT NULL PRIMARY KEY NONCLUSTERED,
	[TIME] INT NOT NULL, 
    [COUNTER] INT NOT NULL DEFAULT 0, 
--    CONSTRAINT [PK_T_TRACK_COUNTER] PRIMARY KEY NONCLASTERED ([TRACK_ID])
) WITH (MEMORY_OPTIMIZED=ON)
GO
