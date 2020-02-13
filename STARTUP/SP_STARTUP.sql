CREATE PROCEDURE [STARTUP].[SP_STARTUP]
	@BARRIER FLOAT
AS
BEGIN
	
	SET NOCOUNT ON;
	
	-- Инициализация базы данных

	-- Стираем данные из таблиц

	TRUNCATE TABLE [PLAYER].[T_STATE];
	-- TRUNCATE TABLE [PLAYER].[T_TRACK_COUNTER];
	DELETE FROM [PLAYER].[T_TRACK_COUNTER];
	TRUNCATE TABLE [TEST].[T_TEST_RESULT];
	DBCC CHECKIDENT ('[TEST].[T_TEST_RESULT]', RESEED, 1);
	--
	TRUNCATE TABLE [PLAYER].[T_TRACKS];
	DBCC CHECKIDENT ('[PLAYER].[T_TRACKS]', RESEED, 1);

	DELETE FROM [PLAYER].[T_TRACK_LOG]
	DELETE FROM [PLAYER].[T_OPERATION_TYPES];
	DBCC CHECKIDENT ('[PLAYER].[T_TRACK_LOG]', RESEED, 1);

	-- Заносим данные в справочник
	INSERT INTO [PLAYER].[T_OPERATION_TYPES]([ID], [NAME]) VALUES
		( 1 , N'INSERT'), 
		( 2 , N'UPDATE'),
		( 3 , N'DELETE'), 
		( 4 , N'GET');

	-- Заносим список треков
	INSERT INTO [PLAYER].T_TRACKS ([NUMBER], [NAME], [TIME]) VALUES
		( 1 , N'MВидео.mp4'		, 5	), 
		( 2 , N'Эльдорадо.mp4'	, 5 ),
		( 3 , N'Перекресток.mp4', 10),
		( 4 , N'Лента.mp4'		, 10),
		( 5 , N'Форд.mp4'		, 5	),
		( 6 , N'Ашан.mp4'		, 5	),
		( 7 , N'Леруа.mp4'		, 5	),
		( 8 , N'Леново.mp4'		, 5	),
		( 9 , N'Фольксваген.mp4', 5	),
		( 10, N'Йота.mp4'		, 5	);

	INSERT INTO [PLAYER].[T_STATE](LAST_TRACK_ID, MAX_TRACK_ID, MIN_TRACK_ID, BARRIER)
		SELECT
			MIN(ID),
			MAX(ID), 
			MIN(ID), 
			@BARRIER 
			FROM [PLAYER].T_TRACKS

	INSERT INTO [PLAYER].T_TRACK_COUNTER ([TRACK_ID], [TIME], [COUNTER])
		SELECT [ID], [TIME], 0
			FROM [PLAYER].T_TRACKS

	DECLARE @RND FLOAT;
	SET @RND=RAND(30);

END