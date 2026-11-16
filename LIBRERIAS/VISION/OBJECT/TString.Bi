''' ============================================================================
''' VISION / OBJECT / TString
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TString Extends TValue
	Protected:
		FValue As String
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As String)
		Declare Constructor(ByRef Source As Const TString)
		Declare Property Value() As String
		Declare Operator Let(ByVal NewValue As String)
		Declare Property Length() As Integer
		Declare Property Upper() As String
		Declare Property Lower() As String
		Declare Property Trimmed(ByVal DoTrim As Boolean) As String
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Virtual Property IsEmpty() As Boolean Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As String
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TString.Cast() As String
	Return This.FValue
End Operator

Function TString.Clone() As TObject Ptr
	Return New TString(This.FValue)
End Function

Constructor TString()
	Base()
	This.FValue = ""
End Constructor

Constructor TString(ByVal NewValue As String)
	Base()
	This.FValue = NewValue
End Constructor

Constructor TString(ByRef Source As Const TString)
	Base()
	This.FValue = Source.FValue
End Constructor

Function TString.GetValueText() As String
	Return This.FValue
End Function

Function TString.IsDefaultValue() As Boolean
	Return (Len(This.FValue) = 0)
End Function

Property TString.IsEmpty() As Boolean
	Return (Len(This.FValue) = 0)
End Property

Property TString.Kind() As String
	Return "String"
End Property

Property TString.Length() As Integer
	Return Len(This.FValue)
End Property

Operator TString.Let(ByVal NewValue As String)
	This.FValue = NewValue
End Operator

Property TString.Lower() As String
	Return Lcase(This.FValue)
End Property

Property TString.Name() As String
	Return "TString"
End Property

Operator =(ByRef Lhs As TString, ByVal Rhs As String) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As String, ByRef Rhs As TString) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TString.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = ""
End Sub

Property TString.Trimmed(ByVal DoTrim As Boolean) As String
	If DoTrim = False Then Return This.FValue
	Return Trim$(This.FValue)
End Property

Property TString.Upper() As String
	Return Ucase(This.FValue)
End Property

Property TString.Value() As String
	Return This.FValue
End Property
