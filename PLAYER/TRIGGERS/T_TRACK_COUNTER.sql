﻿CREATE TABLE [PLAYER].[T_TRACK_COUNTER]
(
    [TRACK_ID] BIGINT NOT NULL,
	[TIME] INT NOT NULL, 
    [COUNTER] INT NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_T_TRACK_COUNTER] PRIMARY KEY ([TRACK_ID])
)
