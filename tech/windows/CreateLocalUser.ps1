$cn = [ADSI]"WinNT://MACHINENAME"
$user = $cn.Create("User","TestUser1")
$user.SetPassword("password1")
$user.setinfo()
$user.description = "Test user"
$user.SetInfo()

# Password Never Expires
$user.invokeSet("userFlags", ($user.userFlags[0] -BOR 65536))
$user.CommitChanges()
