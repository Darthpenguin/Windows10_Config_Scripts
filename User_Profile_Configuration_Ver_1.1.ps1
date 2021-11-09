<#
Script Name:    user_profile_policies.ps1
Description:    This script is will execute a number of registry tweaks for the current user
Author:         Jeff Paxton
Email:          jpaxton@brokerlink.ca
Version:        1.1
Date:           June 2021
#>

$ErrorActionPreference= 'silentlycontinue'

#####################################################################
####              set registry value function                    ####
#####################################################################
function TweakReg {
IF(!(Test-Path $registryPath))
 {
  New-Item -Path $registryPath -Force | Out-Null
  New-ItemProperty -Path $registryPath -Name $name -Type $type -Value $value -Force| Out-Null
 }
ELSE
 {Set-ItemProperty -Path $registryPath -Name $name -Type $type -Value $value -Force | Out-Null}
}
#####################################################################
####                  End registry set value function            ####
#####################################################################

######################################################################
####                   Taskbar Configuration                      ####
######################################################################

#hide synaptics touchpad system tray icon
$registryPath = "HKCU:\Software\Synaptics\SynTPEnh"
$name = "TrayIcon"
$type = "DWORD"
$value = "33" 
TweakReg

#hide taskbar search box
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
$name = "SearchboxTaskbarMode"
$type = "DWORD"
$value = "0" 
TweakReg

#hide Cortana Button from TaskBar
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "ShowCortanaButton"
$type = "DWORD"
$value = "0" 
TweakReg

#hide taskview button from taskbar
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "ShowTaskViewButton"
$type = "DWORD"
$value = "0"
TweakReg

#never combine taskbar buttons on primary taskbar
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "TaskbarGlomLevel"
$type = "DWORD"
$value = "2"
TweakReg

#never combine taskbar buttons on all secondary displays
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "MMTaskbarGlomLevel"
$type = "DWORD"
$value = "2"
TweakReg 

#always show all icons in the system tray
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
$name = "EnableAutoTray"
$type = "DWORD"
$value = "0"
TweakReg

#Hide Language Bar from Taskbar
$registryPath = "HKCU:\Software\Microsoft\CTF\LangBar"
$name = "ShowStatus"
$type = "DWORD"
$value = "3"
TweakReg

#Hide 'Meet Now'
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$name = "HideSCAMeetNow"
$type = "DWORD"
$value = "1"
TweakReg

#remove the intel graphics driver icon from the system tray
$registryPath = "HKCU:\SOFTWARE\Intel\Display\igfxcui\igfxtray\TrayIcon"
$name = "ShowTrayIcon"
$type = "DWORD"
$value = "0"
TweakReg

###############################################################################################
####                          End Taskbar Configurations                                   ####
###############################################################################################

##########################################################
####           Desktop configurations                 ####
##########################################################

#remove recyclebin from the desktop (option 1)
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
$name = "{645FF040-5081-101B-9F08-00AA002F954E}"
$type = "DWORD"
$value = "1"
TweakReg 

#remove recyclebin from the desktop (option 2)
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu"
$name = "{645FF040-5081-101B-9F08-00AA002F954E}"
$type = "DWORD"
$value = "1"
TweakReg

$paths = Get-ChildItem -Directory C:\Users | Select-Object $_.Name
ForEach ($path in $paths){
    If (test-path "C:\Users\$path\Desktop\Microsoft Edge.lnk")
    {
        Remove-Item -Path "C:\Users\$path\Desktop\Microsoft Edge.lnk" -Force

    }
}

###########################################################
####           End Desktop Configurations              ####
###########################################################

###########################################################
####          Windows Explorer Configurations          ####
###########################################################

#Lauching Windows Explorer goes to the 'This PC' location by default
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "LaunchTo"
$type = "DWORD"
$value = "1"
TweakReg

#show file extensions for known file types in Windows Explorer
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "HideFileExt"
$type = "DWORD"
$value = "0"
TweakReg

##########################################################
####       End Windows Explorer Configurations        ####
##########################################################

##########################################################
####                      MISC                        ####
##########################################################

#swap powershell for cmd in the start button right-click menu
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$name = "DontUsePowerShellOnWinX"
$type = "DWORD"
$value = "1"
TweakReg

#apply system dark theme
$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$name = "AppsUseLightTheme"
$type = "DWORD"
$value = "0" 
TweakReg

#########################################################
####                     End MISC                    ####
#########################################################

###############################################################################################
####                   Turn off all Windows spotlight features                            #####
###############################################################################################

$registryPath = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"
$name = "DisableWindowsSpotlightFeatures"
$type = "DWORD"
$value = "1"
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
$name = "RotatingLockScreenEnabled"
$type = "string"
$value = "0"
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
$name = "RotatingLockScreenOverlayEnabled"
$type = "DWORD"
$value = "0"
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "LockImageFlags"
$type = "DWORD"
$value = "0"
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "CreativeId"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "PortraitAssetPath"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "LandscapeAssetPath"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "PlacementId"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "ImpressionToken"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "HotspotImageFolderPath"
$type = "string"
$value = ""
TweakReg

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Lock Screen\Creative"
$name = "CreativeJson"
$type = "string"
$value = ""
TweakReg

#########################################################################################
#####                      End Spotlight Disabling code.                            #####
#########################################################################################

#Hide Citrix 'Add Account' wizard [pop-up]
$registryPath = "HKCU:\Software\Citrix\Receiver"
$name = "HideAddAccountOnRestart"
$type = "DWORD"
$value = "1"
TweakReg

#Enable High-DPI for Citrix Workspace
$registryPath = "HKCU:\SOFTWARE\Citrix\ICA Client\DPI"
$name = "Enable_DPI"
$type = "DWORD"
$value = "1"
TweakReg

stop-process -name explorer –force

#############################################
## So long and thanks for all the fish.  ####
#############################################
