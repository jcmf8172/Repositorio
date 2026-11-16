''' ============================================================================
''' VISION / OBJECT / TLongInt
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TLongInt Extends TValue
	Protected:
		FValue As LongInt
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As LongInt)
		Declare Property Value() As LongInt
		Declare Operator Let(ByVal NewValue As LongInt)
		Declare Property MinValue() As LongInt
		Declare Property MaxValue() As LongInt
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As LongInt
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TLongInt.Cast() As LongInt
	Return This.FValue
End Operator

Function TLongInt.Clone() As TObject Ptr
	Return New TLongInt(This.FValue)
End Function

Constructor TLongInt()
	Base()
	This.FValue = 0
End Constructor

Constructor TLongInt(ByVal NewValue As LongInt)
	Base()
	This.FValue = NewValue
End Constructor

Function TLongInt.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TLongInt.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TLongInt.Kind() As String
	Return "LongInt"
End Property

Operator TLongInt.Let(ByVal NewValue As LongInt)
	This.FValue = NewValue
End Operator

Property TLongInt.MaxValue() As LongInt
	Return Cast(LongInt, &h7FFFFFFFFFFFFFFF)
End Property

Property TLongInt.MinValue() As LongInt
	Return Cast(LongInt, &h8000000000000000)
End Property

Property TLongInt.Name() As String
	Return "TLongInt"
End Property

Operator =(ByRef Lhs As TLongInt, ByVal Rhs As LongInt) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As LongInt, ByRef Rhs As TLongInt) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TLongInt.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TLongInt.Value() As LongInt
	Return This.FValue
End Property
