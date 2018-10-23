#Run as administrator
param([switch]$Elevated, [string]$ip = "ip", [string]$interface = "interface")

function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Test-Admin) -eq $false)  {
    if ($elevated) 
    {
        # tried to elevate, did not work, aborting
    } 
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated -ip {1} -interface "{2}"' -f ($myinvocation.MyCommand.Definition), $ip, $interface)
	}
	exit
}

#Set DNS
# Write-Output "EXECUTE: netsh interface ipv4 set dns \`"$interface\`" static $ip"
cmd.exe /c "netsh interface ipv4 set dns \`"$interface\`" static $ip"

exit
