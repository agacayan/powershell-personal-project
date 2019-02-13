
#Creating encrypted password file
Read-Host -AsSecureString | ConvertFrom-SecureString | Out-File -FilePath <filename>.securestring

#Decrypting password file
$PlainPassword = Get-Content C:\Users\youruser\Documents\<filename>.securestring

$SecurePassword = ConvertTo-SecureString $PlainPassword
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$UnsecurePassword | Out-GridView

