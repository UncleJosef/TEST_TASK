﻿-- Как должен был рассчитан барьер
-- DECLARE @S FLOAT=8.0*72/(8*72+2*36);
-- PRINT @S;

-- ВНИМАНИЕ! У MS SQL не совсем равномерное распределение

-- Инициализируем программу
EXEC [STARTUP].SP_STARTUP 0.8832;

-- Запускаем тест
-- Первое значение
-- @HOUR - испытания в часах
-- Второе значение
-- 0 - перебор
-- 1 - случайный выбор

EXEC [TEST].[SP_TEST] 10,1;
