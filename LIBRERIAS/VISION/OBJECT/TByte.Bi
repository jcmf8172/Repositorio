''' ============================================================================
''' VISION / OBJECT / TByte
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TByte Extends TValue
	Protected:
		FValue As UByte
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UByte)
		Declare Property Value() As UByte
		Declare Operator Let(ByVal NewValue As UByte)
		Declare Property MinValue() As UByte
		Declare Property MaxValue() As UByte
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UByte
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TByte.Cast() As UByte
	Return This.FValue
End Operator

Function TByte.Clone() As TObject Ptr
	Return New TByte(This.FValue)
End Function

Constructor TByte()
	Base()
	This.FValue = 0
End Constructor

Constructor TByte(ByVal NewValue As UByte)
	Base()
	This.FValue = NewValue
End Constructor

Function TByte.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TByte.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TByte.Kind() As String
	Return "Byte"
End Property

Operator TByte.Let(ByVal NewValue As UByte)
	This.FValue = NewValue
End Operator

Property TByte.MaxValue() As UByte
	Return 255
End Property

Property TByte.MinValue() As UByte
	Return 0
End Property

Property TByte.Name() As String
	Return "TByte"
End Property

Operator =(ByRef Lhs As TByte, ByVal Rhs As UByte) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UByte, ByRef Rhs As TByte) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TByte.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TByte.Value() As UByte
	Return This.FValue
End Property
