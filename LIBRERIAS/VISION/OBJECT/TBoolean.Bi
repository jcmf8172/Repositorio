''' ============================================================================
''' VISION / OBJECT / TBoolean
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TBoolean Extends TValue
	Protected:
		FValue As Boolean
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Boolean)
		Declare Constructor(ByRef Source As Const TBoolean)
		Declare Property Value() As Boolean
		Declare Operator Let(ByVal NewValue As Boolean)
		Declare Property Inverted(ByVal DoInvert As Boolean) As Boolean
		Declare Property AsInteger() As Integer
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Boolean
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Property TBoolean.AsInteger() As Integer
	If This.FValue Then Return 1
	Return 0
End Property

Operator TBoolean.Cast() As Boolean
	Return This.FValue
End Operator

Function TBoolean.Clone() As TObject Ptr
	Return New TBoolean(This.FValue)
End Function

Constructor TBoolean()
	Base()
	This.FValue = False
End Constructor

Constructor TBoolean(ByVal NewValue As Boolean)
	Base()
	This.FValue = NewValue
End Constructor

Constructor TBoolean(ByRef Source As Const TBoolean)
	Base()
	This.FValue = Source.FValue
End Constructor

Function TBoolean.GetValueText() As String
	If This.FValue Then Return "True"
	Return "False"
End Function

Property TBoolean.Inverted(ByVal DoInvert As Boolean) As Boolean
	If DoInvert = False Then Return This.FValue
	Return (Not This.FValue)
End Property

Function TBoolean.IsDefaultValue() As Boolean
	Return (This.FValue = False)
End Function

Property TBoolean.Kind() As String
	Return "Boolean"
End Property

Operator TBoolean.Let(ByVal NewValue As Boolean)
	This.FValue = NewValue
End Operator

Property TBoolean.Name() As String
	Return "TBoolean"
End Property

Operator =(ByRef Lhs As TBoolean, ByVal Rhs As Boolean) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Boolean, ByRef Rhs As TBoolean) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TBoolean.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = False
End Sub

Property TBoolean.Value() As Boolean
	Return This.FValue
End Property
