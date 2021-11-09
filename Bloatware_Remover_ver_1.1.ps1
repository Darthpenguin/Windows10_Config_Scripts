$ErrorActionPreference = 'SilentlyContinue'
Write-Output "Uninstalling default apps"
$apps = @(
    # default Windows 10 apps
    "Microsoft.3DBuilder"
    "Microsoft.Appconnector"
    "Microsoft.BingFinance"
    "Microsoft.BingNews"
    "Microsoft.BingSports"
    "Microsoft.BingTranslator"
    "Microsoft.BingWeather"
    #"Microsoft.FreshPaint"
    "Microsoft.GamingServices"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftPowerBIForWindows"
    "Microsoft.MicrosoftSolitaireCollection"
    #"Microsoft.MicrosoftStickyNotes"
    "Microsoft.MinecraftUWP"
    "Microsoft.NetworkSpeedTest"
    "Microsoft.Office.OneNote"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.SkypeApp"
    "Microsoft.Wallet"
    #"Microsoft.Windows.Photos"
    "Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsPhone"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"   # can't be re-installed
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"

    # Threshold 2 apps
    "Microsoft.CommsPhone"
    "Microsoft.ConnectivityStore"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    "Microsoft.Messaging"
    "Microsoft.Office.Sway"
    "Microsoft.OneConnect"
    "Microsoft.WindowsFeedbackHub"

    # Creators Update apps
    "Microsoft.Microsoft3DViewer"
    #"Microsoft.MSPaint"

    #Redstone apps
    "Microsoft.BingFoodAndDrink"
    "Microsoft.BingHealthAndFitness"
    "Microsoft.BingTravel"
    "Microsoft.WindowsReadingList"

    # Redstone 5 apps
    "Microsoft.MixedReality.Portal"
    "Microsoft.ScreenSketch"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.YourPhone"

    # non-Microsoft
    "2FE3CB00.PicsArt-PhotoStudio"
    "46928bounde.EclipseManager"
    "4DF9E0F8.Netflix"
    "613EBCEA.PolarrPhotoEditorAcademicEdition"
    "6Wunderkinder.Wunderlist"
    "7EE7776C.LinkedInforWindows"
    "89006A2E.AutodeskSketchBook"
    "9E2F88E3.Twitter"
    "A278AB0D.DisneyMagicKingdoms"
    "A278AB0D.MarchofEmpires"
    "ActiproSoftwareLLC.562882FEEB491" # next one is for the Code Writer from Actipro Software LLC
    "CAF9E577.Plex"  
    "ClearChannelRadioDigital.iHeartRadio"
    "D52A8D61.FarmVille2CountryEscape"
    "D5EA27B7.Duolingo-LearnLanguagesforFree"
    "DB6EA5DB.CyberLinkMediaSuiteEssentials"
    "DolbyLaboratories.DolbyAccess"
    "DolbyLaboratories.DolbyAccess"
    "Drawboard.DrawboardPDF"
    "Facebook.Facebook"
    "Fitbit.FitbitCoach"
    "Flipboard.Flipboard"
    "GAMELOFTSA.Asphalt8Airborne"
    "KeeperSecurityInc.Keeper"
    "NORDCURRENT.COOKINGFEVER"
    "PandoraMediaInc.29680B314EFC2"
    "Playtika.CaesarsSlotsFreeCasino"
    "ShazamEntertainmentLtd.Shazam"
    "SlingTVLLC.SlingTV"
    "SpotifyAB.SpotifyMusic"
    #"TheNewYorkTimes.NYTCrossword"
    "ThumbmunkeysLtd.PhototasticCollage"
    "TuneIn.TuneInRadio"
    "WinZipComputing.WinZipUniversal"
    "XINGAG.XING"
    "flaregamesGmbH.RoyalRevolt2"
    "king.com.*"
    "king.com.BubbleWitch3Saga"
    "king.com.CandyCrushSaga"
    "king.com.CandyCrushSodaSaga"

    # apps which cannot be removed using Remove-AppxPackage
    #"Microsoft.BioEnrollment"
    #"Microsoft.MicrosoftEdge"
    #"Microsoft.Windows.Cortana"
    #"Microsoft.WindowsFeedback"
    #"Microsoft.XboxGameCallableUI"
    #"Microsoft.XboxIdentityProvider"
    #"Windows.ContactSupport"

    # apps which other apps depend on
    "Microsoft.Advertising.Xaml"

    #Microsoft Windows Store
    #"Microsoft.WindowsStore"
)

foreach ($app in $apps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    Get-AppXProvisionedPackage -Online |
        Where-Object DisplayName -EQ $app |
        Remove-AppxProvisionedPackage -Online
}

foreach ($app in $apps) {
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    Get-AppXProvisionedPackage -Online |
        Where-Object DisplayName -EQ $app |
        Remove-AppxProvisionedPackage -Online
}

#Remove HP Sure Run
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Sure Run"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP Sure Recover
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Sure Recover"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP Client Security Manager
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Client Security Manager"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP Sure Click
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Sure Click"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP Sure Sense Installer
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Sure Sense Installer"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP Notifications
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Notifications"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP System Default Settings
$HPAPP = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP System Default Settings"}
IF ($HPAPP) {$HPAPP.Uninstall()}

#Remove HP JumpStart
$Bloatware = "JumpStart"
$RemoveApps = Get-AppxPackage -allusers | where-object {$_.name -match $Bloatware}
$RemovePrApps = Get-AppxProvisionedPackage -online | where-object {$_.displayname -match $Bloatware}
ForEach ($RemovedApp in $RemoveApps) {
	Write-Host Removing app package: $RemovedApp.name
	Remove-AppxPackage -package $RemovedApp -erroraction silentlycontinue
}			
ForEach ($RemovedPrApp in $RemovePrApps) {
	Write-Host Removing provisioned app $RemovedPrApp.displayname
	Remove-AppxProvisionedPackage -online -packagename $RemovedPrApp.packagename -erroraction silentlycontinue
}

#Remove myHP
Get-AppxPackage -allusers | where-object {$_.name -match "myHP"} | Remove-AppxPackage -AllUsers -erroraction silentlycontinue

#Remove HP Support Assistant
#Get-AppxPackage -allusers | where-object {$_.name -match "HPSupportAssistant"} | Remove-AppxPackage -AllUsers -erroraction SilentlyContinue

$hpguids = get-wmiobject -class win32_product | Where-Object {$_.Name -like "HP *"} | Where-Object {$_.Name -notmatch "client security manager"} | Where-Object {$_.Name -notmatch "HP Support Assistant"}

$clientsecurity = get-wmiobject -class win32_product | Where-Object {$_.Name -like "HP *"} | Where-Object {$_.Name -match "client security manager"}

foreach($guid in $hpguids){
$id = $guid.IdentifyingNumber
write-host ""$guid.Name" is being removed."
&cmd /c "msiexec /uninstall $($id) /qn /norestart"
}

Get-ChildItem HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Where-Object {$_.GetValue('DisplayName') -eq 'HP Theft Recovery'} | Remove-Item

# Continue on errors
$ErrorActionPreference = "silentlycontinue"
 
# Target and remove all HP Software except Security Manager
$hpguids = get-wmiobject -class win32_product | Where-Object {$_.Name -like "HP *"} | Where-Object {$_.Name -notmatch "client security manager"} | Where-Object {$_.Name -notmatch "HP Hotkey Support"} | Where-Object {$_.Name -notmatch "HP Support Assistant"}
foreach($guid in $hpguids){
    $id = $guid.IdentifyingNumber
     write-host ""$guid.Name" is being removed."
     &cmd /c "msiexec /uninstall $($id) /qn /norestart"
    }
 
# Kill Client Security Process
Stop-Process -Name DPClientWizard -Force
 
# Target and remove Security Manager
$clientmanager = get-wmiobject -class win32_product | Where-Object {$_.Name -like "HP *"} | Where-Object {$_.Name -match "client security manager"}
foreach($guid in $clientmanager){
    $id = $guid.IdentifyingNumber
     write-host ""$guid.Name" is being removed."
     &cmd /c "msiexec /uninstall $($id) /qn /norestart"
    }
 
# Target and remove Skype
$skypeguid = get-wmiobject -class win32_product | Where-Object {$_.Name -like "*Skype*"}
foreach($guid in $skypeguid){
    $id = $guid.IdentifyingNumber
     write-host ""$guid.Name" is being removed."
     &cmd /c "msiexec /uninstall $($id) /qn /norestart"
    } 
 
# Target and remove Foxit products
$foxitguid = get-wmiobject -class win32_product | Where-Object {$_.Name -like "Foxit *"}
foreach($guid in $foxitguid){
    $id = $guid.IdentifyingNumber
     write-host ""$guid.Name" is being removed."
     &cmd /c "msiexec /uninstall $($id) /qn /norestart"
    } 
 
# Remove left over from HP Theft Recovery in the Program and Features List
Get-ChildItem HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Where-Object {$_.GetValue('DisplayName') -eq 'HP Theft Recovery'} | Remove-Item
       
# Kill Windows Sidebar Process
Stop-Process -Name sidebar -Force
# Remove HP Gadget
Remove-Item "C:\Program Files\Windows Sidebar\Gadgets\DPIDCard.Gadget" -Recurse -Force
# Remove PDF Complete
& "C:\Program Files (x86)\PDF Complete\uninstall.exe" /x /s
& "C:\Program Files (x86)\CyberLink\PowerDVD12\Kernel\DMS\Uninstall.exe" /x /s
# Delete Desktop Shortcuts
Remove-Item "C:\Users\Public\Desktop\Box offer for HP.lnk" -Force
Remove-Item "C:\Users\Public\Desktop\Skype.lnk" -Force
# Remove click to run applications
Remove-Folder "C:\Program Files (x86)\Hewlett-Packard\HP Touchpoint Manager" -Force
# Remove Skype/Box Installers
Remove-Item "C:\Program Files (x86)\Online Services\" -Recurse -Force
# Remove Empty Start Menu Folders
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Communication and Chat" -Recurse -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\HP Help and Support" -Recurse -Force
Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security and Protection" -Recurse -Force

"'C:\Program Files (x86)\Hewlett-Packard\HP Support Framework\UninstallHPSA.exe' /s /v /qn"
 
write-host "All HP Bloatware has been removed."
