From MSDN:

LogonUser function:
> The LogonUser function attempts to log a user on to the local computer. The local computer is the computer from which LogonUser was called. You cannot use LogonUser to log on to a remote computer. You specify the user with a user name and domain and authenticate the user with a plaintext password. If the function succeeds, you receive a handle to a token that represents the logged-on user. You can then use this token handle to impersonate the specified user or, in most cases, to create a process that runs in the context of the specified user.

LOGON32\_LOGON\_NEW\_CREDENTIALS Type:

> LOGON32\_LOGON\_NEW\_CREDENTIALS
> 
> This logon type allows the caller to clone its current token and specify new credentials for outbound connections. The new logon session has the same local identifier but uses different credentials for other network connections.
This logon type is supported only by the LOGON32\_PROVIDER\_WINNT50 logon provider.

From what I understand, this is useful for the following scenario:

> Second, let me point out two situation where the described difference between LOGON32\_LOGON\_INTERACTIVE and LOGON32\_LOGON\_NEW\_CREDENTIALS becomes clear:

> Two domain joined computers: computer\_A, computer\_B
Two users: user\_A (local admin on computer\_A), user\_B (only standard user rights on B)
One networkshare on computer\_B (mynetworkshare, user\_B does have permission to access share).
One local folder on computer\_A (only user\_A has permission to write to this folder).
You run your program on computer\_A (under the account of user\_A). You impersonate user\_B (using LOGON32\_LOGON\_INTERACTIVE). Then you connect to the network share on computer\_B and try to copy a file to the local folder (only user\_A has the permission to write to this folder). Then, you get an access denied error message, because the file operation is done with the permissions of user\_B who does not have permission on the local folder.

> Same situation as above. But now, we use LOGON32\_LOGON\_NEW\_CREDENTIALS to impersonate user\_B. We connect to the network drive and copy a file from the network drive to the local folder. In this case the operation succeeds because the file operation is done with the permissions of user\_A.


So far, I have seen in our environment that LogonUser() with LOGON32\_LOGON\_NEW\_CREDENTIALS always returns true. I presume that this is because it is just copying a token and no authentication is actually happening. 

* https://msdn.microsoft.com/en-us/library/windows/desktop/aa378184%28v=vs.85%29.aspx
* http://stackoverflow.com/a/7614904/73986