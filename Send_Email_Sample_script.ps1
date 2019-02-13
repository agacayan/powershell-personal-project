$textEncoding = [System.Text.Encoding]::UTF8
$SMTPPort = 587
$SMTPUsername = "<email address>"
$SMTPPassword = "C:\Users\youruser\Documents\<password of email>.securestring"
$SecureStringPassword = Get-Content $SMTPPassword | ConvertTo-SecureString
$emailcredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $SMTPUsername,$SecureStringPassword

$days="5"
$name="<Sender Name>"
$image= "https://www.nextadvisor.com/blog/wp-content/uploads/2016/06/bigstock-calendar-detail-shows-change-y-116781983.jpg"
$image2= "http://4.bp.blogspot.com/-fDu4ENMUVFc/U12MZ8HbXPI/AAAAAAAAApk/iBmzwWD8tEo/s1600/keep+calm.png "

$subject="Your Desktop/Laptop password will expire in $days"


$body ="
    <pre style=""font-family: Verdana,Geneva,sans-serif""> 
    Dear $FirstName,
    
    Your Windows desktop/laptop password will expire $messageDays<br>
    To change your password press CTRL + ALT  + Delete and choose Change Password.
    
    <img src=""$image2"" height=""300"" width=""300"">
    
    <b> Password Requirements:</b>
                   •	Password must contain at least 10 characters
                   •	Must contain characters from at least three of the following:
                           o	Capital letters (A, B, C, D ...)
                           o	Lowercase letters (a, b, c, d ...)
                           o	Numbers (0, 1, 2, 3 ...)
                           o	Special characters (! @ # $ % & * _ + - = { } | \ ; < > ? , . / )
                   •	System remembers the last 10 passwords you have used.

    Having trouble with your password? <a href="<help desk link>">create a helpdesk ticket</a>.

    Thanks,

    <Your Name>
    <Title>
    </pre>"
       

Send-MailMessage -From "<Sender Email Address>" -To <Recepient Email Address> -Subject "Test Report Email"  -Body $body -BodyAsHtml -Priority High -Encoding $textEncoding -SmtpServer smtp.gmail.com -Port $SMTPPort -Credential $emailcredential -UseSsl