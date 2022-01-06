$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type mle_output from multilineedit within w_main
end type
type mle_input from multilineedit within w_main
end type
type cb_decode from commandbutton within w_main
end type
type cb_encode from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 2318
integer height = 1168
boolean titlebar = true
string title = "Encrypt/Dencrypt ASC"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
st_2 st_2
mle_output mle_output
mle_input mle_input
cb_decode cb_decode
cb_encode cb_encode
end type
global w_main w_main

type prototypes

end prototypes

forward prototypes
public function string wf_encode (string as_string)
public function string wf_decode (string as_string)
end prototypes

public function string wf_encode (string as_string);//====================================================================
// Function: w_main.wf_encode()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_string	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/01/06
//--------------------------------------------------------------------
// Usage: w_main.wf_encode ( string as_string )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int i
String ls_text,ls_text_after = ''
Long ll_asc

If lenA(Trim(as_string)) < 0 Then	Return ''

For i = 1 To Len(Trim(as_string))
	ls_text = Mid(as_string,i,1)
	ll_asc = Asc(ls_text) -(2*i) - 25
	ls_text_after = ls_text_after +Char(ll_asc)
Next

Return ls_text_after


end function

public function string wf_decode (string as_string);//====================================================================
// Function: w_main.wf_decode()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	as_string	
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2022/01/06
//--------------------------------------------------------------------
// Usage: w_main.wf_decode ( string as_string )
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int i
String ls_text,ls_text_after = ''
Long ll_asc

If Len(Trim(as_string)) < 0 Then Return ''

For i = 1 To Len(Trim(as_string))
	ls_text = Mid(as_string,i,1)
	ll_asc = Asc(ls_text) +(2*i) + 25
	ls_text_after = ls_text_after + Char(ll_asc)
Next

Return ls_text_after


end function

on w_main.create
this.st_3=create st_3
this.st_2=create st_2
this.mle_output=create mle_output
this.mle_input=create mle_input
this.cb_decode=create cb_decode
this.cb_encode=create cb_encode
this.Control[]={this.st_3,&
this.st_2,&
this.mle_output,&
this.mle_input,&
this.cb_decode,&
this.cb_encode}
end on

on w_main.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.mle_output)
destroy(this.mle_input)
destroy(this.cb_decode)
destroy(this.cb_encode)
end on

type st_3 from statictext within w_main
integer x = 64
integer y = 536
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Output Text:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 64
integer y = 20
integer width = 329
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Input Text:"
boolean focusrectangle = false
end type

type mle_output from multilineedit within w_main
integer x = 50
integer y = 624
integer width = 2167
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_input from multilineedit within w_main
integer x = 50
integer y = 100
integer width = 2167
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "https://programmingmethodsit.com/"
borderstyle borderstyle = stylelowered!
end type

type cb_decode from commandbutton within w_main
integer x = 1902
integer y = 512
integer width = 297
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Decode"
end type

event clicked;String  ls_input, ls_output

ls_input = mle_input.Text
ls_output =  wf_decode(ls_input)

mle_output.Text = ls_output


end event

type cb_encode from commandbutton within w_main
integer x = 1573
integer y = 512
integer width = 297
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Encode"
end type

event clicked;String  ls_input, ls_output

ls_input = mle_input.Text
ls_output =  wf_encode(ls_input)

mle_output.Text = ls_output


end event

