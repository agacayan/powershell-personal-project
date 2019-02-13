
#Creating encrypted password file
Read-Host -AsSecureString | ConvertFrom-SecureString | Out-File -FilePath anthonyadmin@playworks.org.securestring

#Decrypting password file
$PlainPassword = Get-Content C:\Users\anthonyadmin\Documents\Scirpts\anthonyadmin@playworks.org.securestring

$SecurePassword = ConvertTo-SecureString $PlainPassword
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$UnsecurePassword | Out-GridView

