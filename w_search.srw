$PBExportHeader$w_search.srw
forward
global type w_search from window
end type
type sle_1 from singlelineedit within w_search
end type
type st_1 from statictext within w_search
end type
type dw_1 from datawindow within w_search
end type
end forward

global type w_search from window
integer width = 3378
integer height = 1408
boolean titlebar = true
string title = "search"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
st_1 st_1
dw_1 dw_1
end type
global w_search w_search

on w_search.create
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.sle_1,&
this.st_1,&
this.dw_1}
end on

on w_search.destroy
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_1)
end on

type sle_1 from singlelineedit within w_search
event ue_search pbm_enchange
integer x = 768
integer y = 52
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_search;
string ls_sc

if trim(this.text)='' then
	dw_1.setfilter('')
	dw_1.filter()
else 
	///ls_sc="item_name like '%"+trim(this.text)+"%'"
	ls_sc="lower(item_name) like '%"+lower(this.text)+"%'"
	dw_1.setfilter(ls_sc)
	dw_1.filter()
end if
end event

event modified;//
//
//string ls_sc
//
//if trim(this.text)='' then
//	dw_1.setfilter('')
//	dw_1.filter()
//else 
//	///ls_sc="item_name like '%"+trim(this.text)+"%'"
//	ls_sc="lower(item_name) like '%"+lower(this.text)+"%'"
//	dw_1.setfilter(ls_sc)
//	dw_1.filter()
//end if
end event

type st_1 from statictext within w_search
integer x = 201
integer y = 48
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Item Name"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_search
integer x = 123
integer y = 256
integer width = 2944
integer height = 752
integer taborder = 10
string title = "none"
string dataobject = "d_search"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject( sqlca)
this.retrieve( )
end event

