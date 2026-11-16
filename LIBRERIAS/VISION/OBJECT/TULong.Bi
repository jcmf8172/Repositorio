''' ============================================================================
''' VISION / OBJECT / TULong
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TULong Extends TValue
	Protected:
		FValue As ULong
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As ULong)
		Declare Property Value() As ULong
		Declare Operator Let(ByVal NewValue As ULong)
		Declare Property MinValue() As ULong
		Declare Property MaxValue() As ULong
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As ULong
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TULong.Cast() As ULong
	Return This.FValue
End Operator

Function TULong.Clone() As TObject Ptr
	Return New TULong(This.FValue)
End Function

Constructor TULong()
	Base()
	This.FValue = 0
End Constructor

Constructor TULong(ByVal NewValue As ULong)
	Base()
	This.FValue = NewValue
End Constructor

Function TULong.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TULong.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TULong.Kind() As String
	Return "ULong"
End Property

Operator TULong.Let(ByVal NewValue As ULong)
	This.FValue = NewValue
End Operator

Property TULong.MaxValue() As ULong
	Return &hFFFFFFFFu
End Property

Property TULong.MinValue() As ULong
	Return 0
End Property

Property TULong.Name() As String
	Return "TULong"
End Property

Operator =(ByRef Lhs As TULong, ByVal Rhs As ULong) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As ULong, ByRef Rhs As TULong) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TULong.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TULong.Value() As ULong
	Return This.FValue
End Property
