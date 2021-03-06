﻿CREATE TRIGGER [TRG_TRACKS_UPDATE]
	ON [PLAYER].[T_TRACKS]
	FOR UPDATE, INSERT, DELETE
	AS
	BEGIN
		SET NOCOUNT ON;
		WITH
		TMP
		AS
		(
			SELECT	I.ID INS_ID, I.NAME INS_NANE, I.NUMBER INS_NUMBER, I.TIME INS_TIME,
					D.ID DEL_ID, D.NAME DEL_NANE, D.NUMBER DEL_NUMBER, D.TIME DEL_TIME
				FROM inserted I	FULL JOIN deleted D ON I.ID=D.ID
		)
		INSERT INTO [PLAYER].T_TRACK_LOG (OPERATION_TYPE_ID, TRACK_ID, CONTENT)
			SELECT 
					CASE 
						WHEN NOT DEL_ID IS NULL AND NOT INS_ID IS NULL THEN 2
						WHEN NOT DEL_ID IS NULL THEN 3
						ELSE 1
					END,
					CASE 
						WHEN NOT DEL_ID IS NULL THEN DEL_ID
						ELSE INS_ID
					END,
					CASE 
						WHEN NOT DEL_ID IS NULL AND NOT INS_ID IS NULL THEN N'Изменен трек ID='+CAST(INS_ID AS NVARCHAR(12))+N' Было:'+[PLAYER].F_LOG_STRING(DEL_NUMBER, DEL_NANE, DEL_TIME)+N' Стало:'+[PLAYER].F_LOG_STRING(INS_NUMBER, INS_NANE, INS_TIME)
						WHEN NOT DEL_ID IS NULL THEN N'Удален трек ID='+CAST(DEL_ID AS NVARCHAR(12))+[PLAYER].F_LOG_STRING(DEL_NUMBER, DEL_NANE, DEL_TIME)
						ELSE N'Добавлен трек ID='+CAST(INS_ID AS NVARCHAR(12))+[PLAYER].F_LOG_STRING(INS_NUMBER, INS_NANE, INS_TIME)
					END
				FROM TMP;
		WITH
			TMP
		AS
		(
			SELECT T.CHANGED_USER, T.CHANGED_TIME FROM inserted I INNER JOIN [PLAYER].[T_TRACKS] T ON I.ID=T.ID
		)
		UPDATE TMP 
			SET CHANGED_USER=USER_NAME(), CHANGED_TIME=GETDATE();
	END