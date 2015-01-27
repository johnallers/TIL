##Windows Server 2003 - Restoring Permissions on Scheduled Tasks##

Restore permissions:

	cd\
	cacls c:\windows\tasks /T /E /P Administrators:F
	cacls c:\windows\tasks /T /E /P SYSTEM:F
 