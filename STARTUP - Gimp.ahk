#SingleInstance force
#NoEnv
#Warn
#Include %A_ScriptDir%\config.ahk 

Run, "C:\Program Files\GIMP 2\bin\gimp-2.8.exe" -f, %WorkDir%, Max
WinMaximize  

Sleep, 500
WinActivate, GNU Image Manipulation Program ahk_class gdkWindowToplevel
Sleep, 100
; Send, {m}
; Send, {LControl Down}{o}{LControl Up}
; Sleep, 100
; Send, {Down}
; Sleep, 100

ExtractTrack(texure, aplha){
	Sleep, 350
	SelectFile(texure)
	Sleep, 350
	Click
	Sleep, 350
	SelectFile(aplha)
	Sleep, 350
	Click
	CopyClosePasteFile()
	Sleep, 100
	AlphaSelectionToChannel()
	LayerActivate()
	LayerDelete()
	ChannelToSelection()
	LayerActivate()
	Send, {LAlt Down}{s}{LAlt Up}{i}{Delete}
	Sleep, 100
	SelectNone()
	Sleep, 100
}


Shear(mag_x, mag_y){
	Sleep, 100
	Send, {LAlt Down}{t}{LAlt Up}{t}{h}
	Sleep, 100
	Send, %mag_x% 
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, %mag_y%
	Sleep, 100
	Send, {LAlt Down}{s}{LAlt Up}
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{i}
	Sleep, 100
	Send, {m}
}

LayerOffset(X, Y){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{t}{o}
	Sleep, 100
	Send, %X%
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, %Y%
	Sleep, 100
	Loop, 3 {
		Send, {Tab}
		Sleep, 100
	}
	Loop, 2{
		Send, {Down}
		Sleep, 100
	}
	Send, {LAlt Down}{o}{LAlt Up}
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{i}
	Sleep, 100
}

LayerBoundarySize(LayerWidth, LayerHeight, OffSet_x, OffSet_y ){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}
	Loop, 5{
		Sleep, 100
		Send, {Up}
	}
	Send, {Enter}
	Sleep, 100
	Send, %LayerWidth%
	Sleep, 100
	Send, {Tab}{Tab}
	Sleep, 100
	Send, %LayerHeight%
	Sleep, 100
	Send, {Tab}{Tab}
	Sleep, 100
	Send, %OffSet_x%
	Sleep, 100
	Send, {Tab}
	Sleep, 100
	Send, %OffSet_y%
	Sleep, 100
	Send, {LAlt Down}{r}{LAlt Up}{Right}{Enter}
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{i}
	Sleep, 100
}

LayerMergeDown(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{w}
	Sleep, 100
}

SelectNone(){
	Sleep, 100
	Send, {LControl Down}{LShift Down}{a}{LControl Up}{LShift Up} 	
	Sleep, 100
}

ApplyTracks(){
	ChannelToSelection()
	LayerActivate()
	Send, {Delete}
	Sleep, 100
	SelectNone()
}

ChannelToSelection(){
	Sleep, 100
	Click, 102, 841 Right, , Down
	Sleep, 100
	Click, 102, 841 Right, , Up
	Sleep, 100
	Send, {c}
	Sleep, 100
}

SelectAllAndCopy(){
	Sleep, 100
	Send, {LControl Down}{a}{LControl Up}
	Sleep, 100
	Send, {LControl Down}{c}{LControl Up}
	Sleep, 100
}

PasteAsNewLayer(){
	Sleep, 100
	Send, {LControl Down}{v}{LControl Up}
	Sleep, 100
	Send, {LControl Down}{LShift Down}{n}{LControl Up}{LShift Up} 	
	Sleep, 100

}

LayerFlipHorizontal(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}
	Sleep, 100
	Send, {t}
	Sleep, 100
	Send, {h}
	Sleep, 100
}

LayerRotate180(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}
	Sleep, 100
	Send, {t}
	Sleep, 100
	Send, {1}
	Sleep, 100
}

LayerRotateClockwise(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}
	Sleep, 100
	Send, {t}
	Sleep, 100
	Send, {c}
	Sleep, 100
}

LayerRotateCounterClockwise(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}
	Sleep, 100
	Send, {t}
	Sleep, 100
	Send, {w}
	Sleep, 100
}

CopyClosePasteFile(){
	SelectAllAndCopy()
	closeFile()
	LayerActivate()
	Send, {LControl Down}{v}{LControl Up}
	Sleep, 100	
	Send, {LControl Down}{LShift Down}{n}{LControl Up}{LShift Up} 	
	Sleep, 100
}

AlphaSelectionToChannel(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{a}{p}
	Sleep, 100
	Send, {LAlt Down}{s}{LAlt Up}{c}
	SelectNone()
}

LayerDelete(){
	Sleep, 100
	Send, {LAlt Down}{l}{LAlt Up}{d}
	Sleep, 100
}

LayerActivate(){
	Sleep, 100
	Click, 1509, 184 Left, , Down
	Sleep, 10
	Click, 1509, 184 Left, , Up
	Sleep, 100
}

Wealth(iid){
	iid_start := SubStr(iid, 1, 8)
	iid_end := SubStr(iid, 10)
	result = %iid_start%%Clipboard%%iid_end%
	return result
	}

closeFile(){
	Sleep, 100
	WinActivate
	Sleep, 100
	Send, {LAlt Down}{f}{LAlt Up}{c}
	WinActivate
	Sleep, 100
	Send, {LControl Down}
	WinActivate
	Sleep, 100
	Send, {d}{LControl Up}
}

ExportTile(fileName){
	Sleep, 100
	Send, {LControl Down}{LShift Down}{e}
	Sleep, 100
	WinActivate, Export Image ahk_class gdkWindowToplevel
	Sleep, 100
	Send, {LControl Up}{LShift Up}
	Sleep, 100
	Send, %fileName%
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	WinActivate, Export Image as PNG ahk_class gdkWindowToplevel
	Sleep, 100
	Send, {Enter}
	Sleep, 100
	WinActivate, Export Image as PNG ahk_class gdkWindowToplevel
	Sleep, 333
	Send, {LAlt Down}{e}{LAlt Up}
	Sleep, 100
	WinActivate
	Sleep, 100
	Send, {LAlt Down}{f}{LAlt Up}
	Sleep, 100
	Send, {c}
	Sleep, 100
	Send, {LControl Down}{d}{LControl Up}
	Sleep, 100
}

SelectFile(texture){
	Sleep, 250
	Send, {LControl Down}{o}{LControl Up}
	Sleep, 250
	WinActivate, Open Image ahk_class gdkWindowToplevel
	Sleep, 250
	Send, {LControl Down}{a}{LControl Up}{Delete}
	Sleep, 250
	Send, %texture%
	Sleep, 250
	Send, {Enter}
	WinActivate

}