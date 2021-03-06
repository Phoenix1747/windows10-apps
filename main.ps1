# Version 1.2 by Phoenix1747

clear-host
$progs = @("MSPaint","Appconnector","3dviewer","MicrosoftStickyNotes","OneConnect","ConnectivityStore","WindowsFeedbackHub","phone","sway","messaging","3dbuilder","windowsalarms","windowscalculator","windowscommunicationsapps","windowscamera","officehub","skypeapp","getstarted","zunemusic","windowsmaps","solitairecollection","bingfinance","zunevideo","bingnews","onenote","people","windowsphone","photos","windowsstore","bingsports","soundrecorder","bingweather","xboxapp")

if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){
	write-host "
 Please run this script with administrator priviliges!
	
 Press any key to exit..." -foregroundcolor Red
	cmd /c pause | out-null
	exit
}


write-host "
 +------------------------------------+
 | Windows10-Apps Removal Tool        |
 | Open-source project by Phoenix1747 |
 +------------------------------------+
" -backgroundColor DarkBlue

$action = read-host " Would you like to (u)ninstall or (r)einstall apps? (u/r)"

if ($action -ceq "u") {
	
	ForEach($prog in $progs){
		clear-host
		write-host ""
		write-host " Do you want to uninstall $prog ?" -foregroundcolor Yellow
		$yn = read-host " Yes (y), No (n), Yes-all (a)"
		
		if ($yn -ceq "y") {
			clear-host
			
			Get-AppxPackage -allusers *$prog* | Remove-AppxPackage
			
			write-host ""
			write-host " Successfully uninstalled $prog!" -foregroundcolor Green
			start-sleep 2
		}
		elseif ($yn -ceq "a") {
			clear-host
			write-host ""
			ForEach($prog in $progs){
			
				Get-AppxPackage -allusers *$prog* | Remove-AppxPackage
				write-host " Successfully uninstalled $prog!" -foregroundcolor Green
			}
			break
		}
		else {
			continue
		}
	}	

clear-host
write-host ""
write-host " Successfully executed. Please reboot your system! Press any key to close..." -backgroundcolor Green -foregroundcolor Black
cmd /c pause | out-null
exit
}

elseif ($action -ceq "r") {
	clear-host
	write-host "
 You chose to reinstall all Windows 10 apps.

 Press any key to start the reinstallation..." -foregroundcolor Yellow
	cmd /c pause | out-null
	
	Add-AppxPackage -register "C:\Program Files\WindowsApps\***\AppxManifest.xml" -DisableDevelopmentMode
	
	clear-host
	write-host ""
	write-host " Successfully executed. Please reboot your system! Press any key to close..." -backgroundcolor Green -foregroundcolor Black
	cmd /c pause | out-null
	exit

}

else {
	clear-host
	write-host "
 Bad usage: You need to use either 'u' or 'r' for this to work!

 Press any key to close..." -foregroundcolor Red
	cmd /c pause | out-null
	exit
}
