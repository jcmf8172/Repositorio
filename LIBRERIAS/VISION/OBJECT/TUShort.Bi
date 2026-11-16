''' ============================================================================
''' VISION / OBJECT / TUShort
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TUShort Extends TValue
	Protected:
		FValue As UShort
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UShort)
		Declare Property Value() As UShort
		Declare Operator Let(ByVal NewValue As UShort)
		Declare Property MinValue() As UShort
		Declare Property MaxValue() As UShort
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UShort
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TUShort.Cast() As UShort
	Return This.FValue
End Operator

Function TUShort.Clone() As TObject Ptr
	Return New TUShort(This.FValue)
End Function

Constructor TUShort()
	Base()
	This.FValue = 0
End Constructor

Constructor TUShort(ByVal NewValue As UShort)
	Base()
	This.FValue = NewValue
End Constructor

Function TUShort.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TUShort.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TUShort.Kind() As String
	Return "UShort"
End Property

Operator TUShort.Let(ByVal NewValue As UShort)
	This.FValue = NewValue
End Operator

Property TUShort.MaxValue() As UShort
	Return 65535
End Property

Property TUShort.MinValue() As UShort
	Return 0
End Property

Property TUShort.Name() As String
	Return "TUShort"
End Property

Operator =(ByRef Lhs As TUShort, ByVal Rhs As UShort) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UShort, ByRef Rhs As TUShort) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TUShort.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TUShort.Value() As UShort
	Return This.FValue
End Property
