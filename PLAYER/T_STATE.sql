﻿CREATE TABLE [PLAYER].[T_STATE]
(
	[ID] INT NOT NULL PRIMARY KEY NONCLUSTERED DEFAULT 1,
	[LAST_TRACK_ID] BIGINT NOT NULL,
	[MAX_TRACK_ID] BIGINT NOT NULL, 
    [MIN_TRACK_ID] BIGINT NOT NULL, 
    [BARRIER] FLOAT NOT NULL
) 
-- WITH ( MEMORY_OPTIMIZED= ON)