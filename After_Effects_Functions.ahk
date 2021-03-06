SetWorkingDir, C:\AHK\2nd-keyboard\support_files

#NoEnv
;Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input 
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm

;-------------------------------------------------------------------------
; HELLO PEOPLES!
; IF YOU ARE NEW TO AUTOHOTKEY, YOU MUST AT LEAST TAKE THE FOLLOWING TUTORIAL:
; https://autohotkey.com/docs/Tutorial.htm
;
; You will need to know some basic scripting to custom tailor most
; of these scripts to your own machine, if you want to use them!
; VERY IMPORTANT NOTE:
; This file works in tandem with ALL_MULTIPLE_KEYBOARD_ASSIGNMENTS.ahk.
; All the functions from HERE are actually CALLED from keyboard shortcuts
; in THAT script. I had to do it this way because of the Stream Deck(s)...
; But you can put your key bindings and functions in the same script if
; you want.
;------------------------------------------------------------------------



twirlAE(open := 1)
{
;Each track is 26 pixels high on my screen. I think.

BlockInput, on
BlockInput, MouseMove

MouseGetPos xPos, yPos
;I work on a 4k, 150% UI scaled screen. You might have to change these  values to fit your own screen.
edge = 250
expanseUp = 32
expanseDown = 10

CoordMode Pixel ;, screen  ; IDK why but it works like this...
CoordMode Mouse, screen
; CoordMode, mouse, window
; CoordMode, pixel, window
; coordmode, Caret, window

;you might need to take your own screenshot (look at mine to see what is needed) and save as .png.

If open = 1
	{
	ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, %A_WorkingDir%\AE_down.png

	if ErrorLevel = 1 ;if that was unable to find it, try again with another image
		ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, *2 %A_WorkingDir%\AE_down2.png
	if ErrorLevel = 1 ;if that was unable to find it, try again with another image
		ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, *2 %A_WorkingDir%\AE_down3.png

	if ErrorLevel = 0
		{
		;tooltip, The icon was found at %FoundX%x%FoundY%.
		;msgbox, The icon was found at %FoundX%x%FoundY%.
		MouseMove, FoundX+8, FoundY+8, 0
		sleep 5
		click left
		sleep 5
		goto resettwirl
		}
	}
else if open = 0
	{

	ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, %A_WorkingDir%\AE_right.png

	if ErrorLevel = 1 ;if that was unable to find it, try again with another image
		ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, *2 %A_WorkingDir%\AE_right2.png
	if ErrorLevel = 1 ;if that was unable to find it, try again with another image
		ImageSearch, FoundX, FoundY, 0, yPos-expanseUp, edge, yPos+expanseDown, *2 %A_WorkingDir%\AE_right3.png
		
	if ErrorLevel = 0
		{
		;msgbox, The icon was found at %FoundX%x%FoundY%.
		MouseMove, FoundX+8, FoundY+8, 0
		sleep 5
		click left
		sleep 5
		goto resettwirl
		}
	}
tooltip, FAIL
;msgbox, , , num enter, 0.5;msgbox, , , num enter, 0.5
resettwirl:
MouseMove, xPos-11, yPos-11, 0
blockinput, off
blockinput, MouseMoveOff
sleep 20
tooltip,
}
;End of AEtwirl()

