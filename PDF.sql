https://www.technipages.com/windows-solve-unable-to-install-printer-another-printer

1 Set environmental Variable :

PATH =C:\Program Files\gs\gs8.71\bin

dw_1.object.datawindow.export.pdf.method = 1
dw_1.object.datawindow.export.pdf.distill.custompostscript = "1"
dw_1.object.datawindow.export.pdf.xslfop.print = "0"
dw_1.saveas("", PDF!, False)

Devices and printers :

Device and Printer : Add Printer : Select Local Printer : Select Port( As File):  Select any of the post script printer driver while installation(Eg : HP Color LaserJet 2800 Series PS post script printer driver can be identified as PS extension).

You can use Ghostscript instead of the HP laser jet

PowerBuilder Function
----------------------
of_Sendmail(as_mail_id,as_file_path,as_inv_no,as_remarks)

string ls_command, ls_rcpt,ls_file_path,ls_inv_no,ls_rem
integer li_rc
 
ls_rcpt = as_mail_id
ls_file_path=as_file_path
ls_inv_no =as_inv_no
ls_rem=as_remarks

ls_command = "printsendpdf.bat " + &
				    "~"" + ls_rcpt + "~" " + &
                      "~""+ls_rem+"~" " + &
					 "~"" + gs_mailbody + "~" " + &
					"~"" + ls_file_path + "~""

li_rc = Run ( ls_command,Minimized!)

Return  li_rc

printsendpdf.bat
-----------------

echo off
@powershell -file .\pdfmail.ps1 -EmailTo %1 -Subject %2 -Body %3 -Attachment %4
exit


PowerShellScript:
-----------------
 Param ([String]$EmailTo,[String]$Subject,[String]$Body,[String]$Attachment)

 $EmailFrom = "gaafa@gmail.com"
 $SMTPServer = "servername"
 $SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
 $Att = New-Object System.Net.Mail.Attachment($Attachment)
 $SMTPMessage.Attachments.add($Att) 
 $SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
 $SMTPClient.UseDefaultCredentials = $true
 $SMTPClient.Send($SMTPMessage)
 Remove-Variable -Name SMTPClient


Other Stuff:
----------
Ghostscript : 8.71 only needs to be installed in the machine


