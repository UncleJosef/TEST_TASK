﻿CREATE FUNCTION [PLAYER].[F_LOG_STRING]
(
	@NUMBER  INT,
	@NAME NVARCHAR(50),
	@TIME INT
)
RETURNS NVARCHAR(255)
AS 
BEGIN
	RETURN N' N='+CAST(@NUMBER AS NVARCHAR(12))+N' Name='+@NAME+N' TIME='+CAST(@TIME AS NVARCHAR(12));
END

