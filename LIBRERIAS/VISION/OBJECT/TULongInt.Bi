''' ============================================================================
''' VISION / OBJECT / TULongInt
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TULongInt Extends TValue
	Protected:
		FValue As ULongInt
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As ULongInt)
		Declare Property Value() As ULongInt
		Declare Operator Let(ByVal NewValue As ULongInt)
		Declare Property MinValue() As ULongInt
		Declare Property MaxValue() As ULongInt
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As ULongInt
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TULongInt.Cast() As ULongInt
	Return This.FValue
End Operator

Function TULongInt.Clone() As TObject Ptr
	Return New TULongInt(This.FValue)
End Function

Constructor TULongInt()
	Base()
	This.FValue = 0
End Constructor

Constructor TULongInt(ByVal NewValue As ULongInt)
	Base()
	This.FValue = NewValue
End Constructor

Function TULongInt.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TULongInt.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TULongInt.Kind() As String
	Return "ULongInt"
End Property

Operator TULongInt.Let(ByVal NewValue As ULongInt)
	This.FValue = NewValue
End Operator

Property TULongInt.MaxValue() As ULongInt
	Return Cast(ULongInt, &hFFFFFFFFFFFFFFFF)
End Property

Property TULongInt.MinValue() As ULongInt
	Return 0
End Property

Property TULongInt.Name() As String
	Return "TULongInt"
End Property

Operator =(ByRef Lhs As TULongInt, ByVal Rhs As ULongInt) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As ULongInt, ByRef Rhs As TULongInt) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TULongInt.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TULongInt.Value() As ULongInt
	Return This.FValue
End Property
