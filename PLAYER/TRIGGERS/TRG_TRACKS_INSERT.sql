﻿-- Сделан один на все
--CREATE TRIGGER [TRG_TRACKS_INSERT]
--	ON [PLAYER].[T_TRACKS]
--	AFTER INSERT
--	AS
--	BEGIN
--		SET NOCOUNT ON;
--		INSERT INTO [PLAYER].T_TRACK_LOG (OPERATION_TYPE_ID, TRACK_ID, CONTENT)
--			SELECT 1,inserted.ID, N'Добавлен трек № '+CAST(inserted.NUMBER AS NVARCHAR(12))+N' с названием '+inserted.NAME
--				FROM inserted
--	END
