''' ============================================================================
''' VISION - Programa de prueba
''' ----------------------------------------------------------------------------
''' Instancia los 17 objetos de la libreria y comprueba sus miembros publicos,
''' el polimorfismo de Clone y los constructores.
'''
''' Devuelve 0 si todas las comprobaciones pasan, o el numero de fallos.
'''
''' Compilar y ejecutar:  tests/compilar.sh
''' ============================================================================

#Include Once "VISION.Bi"

Dim Shared As Integer Pruebas = 0
Dim Shared As Integer Fallos = 0

Sub Comprobar(ByVal Condicion As Boolean, ByVal Descripcion As String)
	Pruebas += 1
	If Condicion Then
		Print "  [ok]    " & Descripcion
	Else
		Fallos += 1
		Print "  [FALLO] " & Descripcion
	End If
End Sub

Print "VISION - prueba de los 17 objetos"
Print

' ---------------------------------------------------------------- TObject ---
Print "TObject"
Dim As TObject obj
Comprobar(obj.Name = "TObject", "Name")
Comprobar(Len(obj.Id) > 0, "Id no vacio")
Comprobar(InStr(obj.ToString, "TObject") > 0, "ToString menciona el tipo")
Comprobar(obj.Clone() = 0, "Clone de la base devuelve 0")

' ----------------------------------------------------------------- TValue ---
Print "TValue"
Dim As TValue tv
Comprobar(tv.Kind = "Value", "Kind")
Comprobar(tv.IsDefault = True, "IsDefault")
Comprobar(tv.IsEmpty = True, "IsEmpty")
Comprobar(InStr(tv.ToString, "Value: [ ? ]") > 0, "ToString usa GetValueText")

' --------------------------------------------------------------- TBoolean ---
Print "TBoolean"
Dim As TBoolean b = TBoolean(True)
Comprobar(b.Value = True, "Value")
Comprobar(b.AsInteger = 1, "AsInteger")
Comprobar(b.Inverted(True) = False, "Inverted(True)")
Comprobar(b.Kind = "Boolean" And b.Name = "TBoolean", "Kind / Name")
Comprobar(b = True And True = b, "operadores =")
Dim As Boolean bn = b
Comprobar(bn = True, "Cast a Boolean")
Comprobar(InStr(b.ToString, "True") > 0, "ToString")
b.Reset(True)
Comprobar(b.Value = False, "Reset")

' ------------------------------------------------------------------ TByte ---
Print "TByte"
Dim As TByte byt = TByte(200)
Comprobar(byt.Value = 200, "Value")
Comprobar(byt.MinValue = 0 And byt.MaxValue = 255, "Min / Max")
Comprobar(byt = 200 And 200 = byt, "operadores =")
Comprobar(byt.Kind = "Byte" And byt.Name = "TByte", "Kind / Name")
Dim As UByte ub = byt
Comprobar(ub = 200, "Cast a UByte")
byt.Reset(True)
Comprobar(byt.Value = 0, "Reset")

' ----------------------------------------------------------------- TSByte ---
Print "TSByte"
Dim As TSByte sbyt = TSByte(-100)
Comprobar(sbyt.Value = -100, "Value")
Comprobar(sbyt.MinValue = -128 And sbyt.MaxValue = 127, "Min / Max")
Comprobar(sbyt = -100, "operador =")
Comprobar(sbyt.Kind = "SByte" And sbyt.Name = "TSByte", "Kind / Name")
Dim As Byte sb = sbyt
Comprobar(sb = -100, "Cast a Byte")
sbyt.Reset(True)
Comprobar(sbyt.Value = 0, "Reset")

' ----------------------------------------------------------------- TShort ---
Print "TShort"
Dim As TShort sh = TShort(-30000)
Comprobar(sh.Value = -30000, "Value")
Comprobar(sh.MinValue = -32768 And sh.MaxValue = 32767, "Min / Max")
Comprobar(sh = -30000, "operador =")
Comprobar(sh.Kind = "Short" And sh.Name = "TShort", "Kind / Name")
Dim As Short shn = sh
Comprobar(shn = -30000, "Cast a Short")
sh.Reset(True)
Comprobar(sh.Value = 0, "Reset")

' ---------------------------------------------------------------- TUShort ---
Print "TUShort"
Dim As TUShort ush = TUShort(60000)
Comprobar(ush.Value = 60000, "Value")
Comprobar(ush.MinValue = 0 And ush.MaxValue = 65535, "Min / Max")
Comprobar(ush = 60000, "operador =")
Comprobar(ush.Kind = "UShort" And ush.Name = "TUShort", "Kind / Name")
Dim As UShort ushn = ush
Comprobar(ushn = 60000, "Cast a UShort")
ush.Reset(True)
Comprobar(ush.Value = 0, "Reset")

' --------------------------------------------------------------- TInteger ---
Print "TInteger"
Dim As TInteger i = TInteger(-2000000000)
Comprobar(i.Value = -2000000000, "Value")
Comprobar(i.MinValue = -2147483648 And i.MaxValue = 2147483647, "Min / Max")
Comprobar(i = -2000000000, "operador =")
Comprobar(i.Kind = "Integer" And i.Name = "TInteger", "Kind / Name")
Dim As Integer inum = i
Comprobar(inum = -2000000000, "Cast a Integer")
i.Reset(True)
Comprobar(i.Value = 0, "Reset")

' -------------------------------------------------------------- TUInteger ---
Print "TUInteger"
Dim As TUInteger ui = TUInteger(4000000000u)
Comprobar(ui.Value = 4000000000u, "Value")
Comprobar(ui.MinValue = 0 And ui.MaxValue = 4294967295u, "Min / Max")
Comprobar(ui = 4000000000u, "operador =")
Comprobar(ui.Kind = "UInteger" And ui.Name = "TUInteger", "Kind / Name")
Dim As UInteger uinum = ui
Comprobar(uinum = 4000000000u, "Cast a UInteger")
ui.Reset(True)
Comprobar(ui.Value = 0, "Reset")

' ------------------------------------------------------------------ TLong ---
Print "TLong"
Dim As TLong l = TLong(123456)
Comprobar(l.Value = 123456, "Value")
Comprobar(l.MinValue = -2147483648 And l.MaxValue = 2147483647, "Min / Max")
Comprobar(l = 123456, "operador =")
Comprobar(l.Kind = "Long" And l.Name = "TLong", "Kind / Name")
Dim As Long lnum = l
Comprobar(lnum = 123456, "Cast a Long")
l.Reset(True)
Comprobar(l.Value = 0, "Reset")

' ----------------------------------------------------------------- TULong ---
Print "TULong"
Dim As TULong ul = TULong(4000000000u)
Comprobar(ul.Value = 4000000000u, "Value")
Comprobar(ul.MinValue = 0 And ul.MaxValue = 4294967295u, "Min / Max")
Comprobar(ul = 4000000000u, "operador =")
Comprobar(ul.Kind = "ULong" And ul.Name = "TULong", "Kind / Name")
Dim As ULong ulnum = ul
Comprobar(ulnum = 4000000000u, "Cast a ULong")
ul.Reset(True)
Comprobar(ul.Value = 0, "Reset")

' --------------------------------------------------------------- TLongInt ---
Print "TLongInt"
Dim As TLongInt li = TLongInt(9000000000000)
Comprobar(li.Value = 9000000000000, "Value")
Comprobar(li.MaxValue = Cast(LongInt, &h7FFFFFFFFFFFFFFF), "Max")
Comprobar(li.MinValue = Cast(LongInt, &h8000000000000000), "Min")
Comprobar(li = 9000000000000, "operador =")
Comprobar(li.Kind = "LongInt" And li.Name = "TLongInt", "Kind / Name")
Dim As LongInt linum = li
Comprobar(linum = 9000000000000, "Cast a LongInt")
li.Reset(True)
Comprobar(li.Value = 0, "Reset")

' -------------------------------------------------------------- TULongInt ---
Print "TULongInt"
Dim As TULongInt uli = TULongInt(123456789)
Comprobar(uli.Value = 123456789, "Value")
Comprobar(uli.MinValue = 0, "Min")
Comprobar(uli.MaxValue = Cast(ULongInt, &hFFFFFFFFFFFFFFFF), "Max")
Comprobar(uli = 123456789, "operador =")
Comprobar(uli.Kind = "ULongInt" And uli.Name = "TULongInt", "Kind / Name")
Dim As ULongInt ulinum = uli
Comprobar(ulinum = 123456789, "Cast a ULongInt")
uli.Reset(True)
Comprobar(uli.Value = 0, "Reset")

' ---------------------------------------------------------------- TSingle ---
Print "TSingle"
Dim As TSingle sg = TSingle(1.5!)
Comprobar(Abs(sg.Value - 1.5) < 0.0001, "Value")
Comprobar(sg.MinValue < -3.0E+38 And sg.MaxValue > 3.0E+38, "Min / Max")
Comprobar(sg.IsNan = False And sg.IsInf = False, "IsNan / IsInf")
Comprobar(sg.Kind = "Single" And sg.Name = "TSingle", "Kind / Name")
Comprobar(Abs(sg.NativeValue() - 1.5!) < 0.0001, "NativeValue")
Dim As Single sgnum = sg
Comprobar(Abs(sgnum - 1.5!) < 0.0001, "Cast a Single")
sg.Reset(True)
Comprobar(sg.Value = 0.0!, "Reset")

' ---------------------------------------------------------------- TDouble ---
Print "TDouble"
Dim As TDouble db = TDouble(2.5)
Comprobar(Abs(db.Value - 2.5) < 0.000001, "Value")
Comprobar(db.MinValue < -1.0E+308 And db.MaxValue > 1.0E+308, "Min / Max")
Comprobar(db.IsNan = False And db.IsInf = False, "IsNan / IsInf")
Comprobar(db.Kind = "Double" And db.Name = "TDouble", "Kind / Name")
Comprobar(Abs(db.NativeValue() - 2.5) < 0.000001, "NativeValue")
Dim As Double dbn = db
Comprobar(Abs(dbn - 2.5) < 0.000001, "Cast a Double")
db.Reset(True)
Comprobar(db.Value = 0.0, "Reset")

' ---------------------------------------------------------------- TString ---
Print "TString"
Dim As TString st = TString("vision")
Comprobar(st.Value = "vision", "Value")
Comprobar(st.Length = 6, "Length")
Comprobar(st.Upper = "VISION" And st.Lower = "vision", "Upper / Lower")
Comprobar(st.IsEmpty = False And st.IsDefault = False, "IsEmpty / IsDefault")
Comprobar(st.Kind = "String" And st.Name = "TString", "Kind / Name")
Comprobar(st = "vision" And "vision" = st, "operadores =")
Dim As String stn = st
Comprobar(stn = "vision", "Cast a String")
Dim As TString stc = TString("  hola  ")
Comprobar(stc.Trimmed(True) = "hola" And stc.Trimmed(False) = "  hola  ", "Trimmed")
Comprobar(InStr(st.ToString, "Value: [ vision ]") > 0, "ToString")
st.Reset(True)
Comprobar(st.Value = "" And st.IsEmpty = True, "Reset")

' ----------------------------------------------------------------- TRect ---
Print "TRect"
Dim As TRect r0
Comprobar(r0.Col = 0 And r0.Row = 0 And r0.Width = 0 And r0.Height = 0, "constructor por defecto")
Comprobar(r0.IsEmpty = True And r0.IsValid = False, "rectangulo vacio")
Dim As TRect r = TRect(1, 2, 3, 4)
Comprobar(r.Contains(1, 2) And r.Contains(3, 5), "Contains dentro")
Comprobar(r.Contains(0, 2) = False And r.Contains(4, 5) = False, "Contains fuera")
Comprobar(r.IsValid = True And r.IsEmpty = False, "IsValid / IsEmpty")
Comprobar(r.Right = 4 And r.Bottom = 6, "Right / Bottom")
Dim As TRect solapa = TRect(3, 4, 2, 2)
Dim As TRect lejos = TRect(10, 10, 2, 2)
Comprobar(r.Intersects(solapa) = True, "Intersects solapando")
Comprobar(r.Intersects(lejos) = False, "Intersects separados")
Dim As TRect r1 = TRect(-2, -1, 10, 10)
r1.ClampToScreen(80, 25)
Comprobar(r1.Col = 0 And r1.Row = 0 And r1.Width = 10 And r1.Height = 10, "ClampToScreen ajusta origen")
Dim As TRect r2 = TRect(75, 20, 20, 20)
r2.ClampToScreen(80, 25)
Comprobar(r2.Width = 5 And r2.Height = 5, "ClampToScreen recorta al limite")

' ------------------------------------------------- Clone / polimorfismo ----
Print "Clone / polimorfismo"
Dim As TObject Ptr clones(13)
Dim As String esperados(13)
clones(0) = b.Clone()    : esperados(0) = "TBoolean"
clones(1) = byt.Clone()  : esperados(1) = "TByte"
clones(2) = sbyt.Clone() : esperados(2) = "TSByte"
clones(3) = sh.Clone()   : esperados(3) = "TShort"
clones(4) = ush.Clone()  : esperados(4) = "TUShort"
clones(5) = i.Clone()    : esperados(5) = "TInteger"
clones(6) = ui.Clone()   : esperados(6) = "TUInteger"
clones(7) = l.Clone()    : esperados(7) = "TLong"
clones(8) = ul.Clone()   : esperados(8) = "TULong"
clones(9) = li.Clone()   : esperados(9) = "TLongInt"
clones(10) = uli.Clone() : esperados(10) = "TULongInt"
clones(11) = sg.Clone()  : esperados(11) = "TSingle"
clones(12) = db.Clone()  : esperados(12) = "TDouble"
clones(13) = st.Clone()  : esperados(13) = "TString"
For k As Integer = 0 To 13
	Comprobar(clones(k)->Name = esperados(k), "Clone " & esperados(k) & " conserva el tipo")
	Comprobar(InStr(clones(k)->ToString, esperados(k)) > 0, "Clone " & esperados(k) & " conserva ToString")
	Delete clones(k)
Next k

' ---------------------------------------------------------------- Resumen ---
Print
Print "Pruebas: " & Pruebas & "   Fallos: " & Fallos
If Fallos = 0 Then
	Print "RESULTADO: OK"
Else
	Print "RESULTADO: FALLOS"
End If

System Fallos
