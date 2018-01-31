#Include %A_ScriptDir%\Bender_startup.ahk 


Loop,%RenderSet% {
	Sleep, 100
	texture := TextDefs[A_Index]
	Sleep, 100
	OpenAndSelectFile(texture)

	Sleep, 100
	Click, 56, 562 Left, , Down
	Sleep, 100
	Click, 56, 562 Left, , Up
	Sleep, 100
	Click, 1152, 722 Left, , Down
	Sleep, 100
	Click, 1152, 722 Left, , Up
	Sleep, 100
	Click, 461, 231 Left, , Down
	Sleep, 100
	Click, 461, 231 Left, , Up
	Sleep, 100

	textureIID := Diagonal[1]
	Clipboard := WealthDefs[texture]
	iid_start := SubStr(textureIID, 1, 8)
	iid_end := SubStr(textureIID, 10)
	result = %iid_start%%Clipboard%%iid_end%.png
	Sleep, 100
	Send, %result%
	Sleep, 100
	Send, {Enter}

}