CREATE TRIGGER connection_limit_trigger ON ALL SERVER
FOR LOGON 
AS 
BEGIN
    -- declare the variable that will store the number of sessions
    DECLARE @currentSessions INT;

    -- set the number of sessions
    SELECT @currentSessions = COUNT(*)
    FROM sys.dm_exec_sessions
    WHERE is_user_process = 1;

    -- check variable
    IF @currentSessions > 20
    BEGIN
        ROLLBACK;

        THROW 51000, 'Maximum number of sessions reached. Please try again later.', 1;
    END
END;
