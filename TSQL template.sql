--Feature:
--Derek W

USE [DATABASE];
GO

BEGIN TRANSACTION;

BEGIN TRY
	--Do work
END TRY
BEGIN CATCH
  SELECT 
        ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH


IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO
