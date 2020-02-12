CREATE PROCEDURE [TEST].[SP_TEST]
	@HOUR INT=0,
	@TYPE INT=0
AS
BEGIN
	SET NOCOUNT ON;
	-- Защита от бесконечного цикла
	IF (@HOUR<0)
	BEGIN
		PRINT N'Неверно указано количество часов испытаний'
		RETURN;
	END
	
	-- Проверяем наличие данных о треках
	DECLARE @MAX_PLAY INT; -- Время проигрывания
	DECLARE @COUNT INT;
	DECLARE @PERIOD INT;
	SELECT @COUNT=COUNT(*), @PERIOD=SUM(TIME) FROM [PLAYER].[T_TRACKS];
	IF (@COUNT=0 OR @PERIOD=0)
	BEGIN
		PRINT N'Нет информации о треках в таблице. Запустите STARTUP.SP_STARTUP'
		RETURN;
	END

	-- Рассчитываем время исполнения в секундах
	IF (@HOUR=0)
		BEGIN
			SET @HOUR=5;
			SET @MAX_PLAY=@HOUR*3600;
		END
	ELSE 
		SET @MAX_PLAY=@HOUR*3600;

	-- Запускаем тестирование
	PRINT N'-- Тест запущен --'
	SELECT @MAX_PLAY AS [Время исполнения]	
	-- Удаляем данные о предыдущем тесте
	TRUNCATE TABLE TEST.T_TEST_RESULT;
	-- Процедура тестирования
	DECLARE @START DATETIME2; -- Время начала выполнения
	DECLARE @TIME INT;
	DECLARE @CURRENT_TIME INT;
	SET @CURRENT_TIME=0;
	
	WHILE (@CURRENT_TIME<@MAX_PLAY)
	BEGIN
		SELECT @TIME=TIME FROM [PLAYER].[T_TRACKS] WHERE ID=(SELECT [LAST_TRACK_ID] FROM [PLAYER].[T_STATE] WHERE ID=1);
		SET  @START=GETDATE();
		-- Определяем время обработки
		INSERT INTO [TEST].[T_TEST_RESULT] (TRACK_NAME)
			EXEC [PLAYER].[SP_GET_TRACK] @TYPE;
		-- Записываем информацию об итерации
		UPDATE [TEST].[T_TEST_RESULT] SET TIME=DATEDIFF(mcs, @START, GETDATE()), START_TIME=@CURRENT_TIME WHERE ID=SCOPE_IDENTITY(); -- данные в микросекундах
		-- 
		SET @CURRENT_TIME=@CURRENT_TIME+@TIME;
	END

	-- Выводим данные о результате тестирования
	PRINT N'-- Тест завершен --'
	-- Выводим данные испытания
	SELECT @CURRENT_TIME AS [Время исполнения];

	PRINT N'-- Время выполнения --'
	SELECT CAST(MIN([TIME]) AS NUMERIC(18,3))/1000000 AS [Минимальное время], CAST(MAX([TIME]) AS NUMERIC(18,3))/1000000 AS [Максимальное время], CAST(AVG([TIME]) AS NUMERIC(18,3))/1000000 AS [Среднее время] FROM [TEST].T_TEST_RESULT;

	PRINT N'-- Количество проигрываний --'
	SELECT 
		[TRACK_NAME] AS [Трек],
		CAST(COUNT(*) AS FLOAT)/@HOUR AS [За в час],
		COUNT(*) [За испытание]
		FROM [TEST].T_TEST_RESULT
		GROUP BY [TRACK_NAME];

END