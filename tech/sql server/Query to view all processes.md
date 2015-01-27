## TSQL Query To Display All Running Processes ##

This is useful for viewing all running processes in SQL Express where SQL Management Studio process tools are not available.

    SELECT  *
    FROM sys.dm_exec_requests 
    	CROSS APPLY sys.dm_exec_sql_text(sql_handle)