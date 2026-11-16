''' ============================================================================
''' VISION / OBJECT / TShort
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TShort Extends TValue
	Protected:
		FValue As Short
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Short)
		Declare Property Value() As Short
		Declare Operator Let(ByVal NewValue As Short)
		Declare Property MinValue() As Short
		Declare Property MaxValue() As Short
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Short
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TShort.Cast() As Short
	Return This.FValue
End Operator

Function TShort.Clone() As TObject Ptr
	Return New TShort(This.FValue)
End Function

Constructor TShort()
	Base()
	This.FValue = 0
End Constructor

Constructor TShort(ByVal NewValue As Short)
	Base()
	This.FValue = NewValue
End Constructor

Function TShort.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TShort.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TShort.Kind() As String
	Return "Short"
End Property

Operator TShort.Let(ByVal NewValue As Short)
	This.FValue = NewValue
End Operator

Property TShort.MaxValue() As Short
	Return 32767
End Property

Property TShort.MinValue() As Short
	Return -32768
End Property

Property TShort.Name() As String
	Return "TShort"
End Property

Operator =(ByRef Lhs As TShort, ByVal Rhs As Short) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Short, ByRef Rhs As TShort) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TShort.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TShort.Value() As Short
	Return This.FValue
End Property
