Copied from http://windowsitpro.com/active-directory/q-how-do-i-enable-anonymous-ldap-binds-windows-server-2008-active-directory-ad:

1. Start Adsiedit.msc (Start, Run, Adsiedit.msc).
2. Expand the Configuration container. Expand Services, Windows NT.
3. Right-click CN=Directory Service and select Properties.
4. Double-click the dSHeuristics attribute.
5. If the value is currently <Not Set>, set it to 0000002. If it isn't currently blank, you must change the 7th character of the string to 2. (For example, if it was 001, 0010002 should be your new value. Click OK. *If it is not visible, check the Filter and ensure that all properties, including unset are displayed.*
6. Close the ADSIEdit tool.

Anything that NT AUTHORITY\ANONYMOUS LOGON or Everyone has rights to can now be read through an anonymous bind.
