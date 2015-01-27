## Verify that an account has access to the Fine-Grained Password Policies: ##

1. Open LDP.exe
2. Connect to the domain.
3. Bind using the credentials.
4. Go to Browse -> Search and use the following settings (modify accordingly):

Base DN: `DC=mydc,DC=mydomain,DC=local`

Filter: `(objectClass=msDS-PasswordSettings)`

Attributes: `msDS-MaximumPasswordAge,distinguishedName`

Click Run.  If no entries are returned, then the user does not have the proper permissions set up.