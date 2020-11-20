#include JSON.ahk
StringCaseSense ,on 
InputBox, UserInput, input box, Please enter file name., , 380,150
Stringupper,UserInput,UserInput
NweUserInput=%UserInput%
if (Instr(UserInput,"V")){
NweUserInput:= StrReplace( NweUserInput , "V" ,"v")

}
; msgbox , %NweUserInput%
length :=StrLen (NweUserInput)
FileRead, json_str, config.json
parsed := JSON.Load(json_str)
; load_file
; MsgBox, % (parsed.object).MaxIndex()
svn_path := parsed.root
if StrLen (length) <= 0 {
	run  "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:repobrowser /path:%svn_path%
	return 
}
else {
	; msgbox, %svn_path%
	loop, % (parsed.object).MaxIndex() 
	{
		
		modal:= parsed.object[A_Index].modal
		
		if (modal == NweUserInput){
			repositry :=parsed.object[A_Index].repositry
			svn_path = %svn_path%%repositry% 
			break
		}
	}
}
msgbox, %svn_path%
run  "C:\Program Files\TortoiseSVN\bin\TortoiseProc.exe" /command:repobrowser /path:%svn_path%
Exitapp
; parsed.object[A_INDEX] ,userinput