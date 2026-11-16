''' ============================================================================
''' VISION / OBJECT / TSByte
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TSByte Extends TValue
	Protected:
		FValue As Byte
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Byte)
		Declare Property Value() As Byte
		Declare Property MinValue() As Byte
		Declare Property MaxValue() As Byte
		Declare Operator Let(ByVal NewValue As Byte)
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Byte
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TSByte.Cast() As Byte
	Return This.FValue
End Operator

Function TSByte.Clone() As TObject Ptr
	Return New TSByte(This.FValue)
End Function

Constructor TSByte()
	Base()
	This.FValue = 0
End Constructor

Constructor TSByte(ByVal NewValue As Byte)
	Base()
	This.FValue = NewValue
End Constructor

Function TSByte.GetValueText() As String
	Return Str(Cast(Short, This.FValue))
End Function

Function TSByte.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TSByte.Kind() As String
	Return "SByte"
End Property

Operator TSByte.Let(ByVal NewValue As Byte)
	This.FValue = NewValue
End Operator

Property TSByte.MaxValue() As Byte
	Return 127
End Property

Property TSByte.MinValue() As Byte
	Return -128
End Property

Property TSByte.Name() As String
	Return "TSByte"
End Property

Operator =(ByRef Lhs As TSByte, ByVal Rhs As Byte) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Byte, ByRef Rhs As TSByte) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TSByte.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TSByte.Value() As Byte
	Return This.FValue
End Property
