''' ============================================================================
''' VISION / OBJECT / TSingle
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TSingle Extends TValue
	Protected:
		FValue As Single
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Single)
		Declare Property Value() As Single
		Declare Operator Let(ByVal NewValue As Single)
		Declare Property MinValue() As Single
		Declare Property MaxValue() As Single
		Declare Property IsNan() As Boolean
		Declare Property IsInf() As Boolean
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Single
		Declare Function NativeValue() As Single Option("SSE")
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TSingle.Cast() As Single
	Return This.NativeValue()
End Operator

Function TSingle.Clone() As TObject Ptr
	Return New TSingle(This.FValue)
End Function

Constructor TSingle()
	Base()
	This.FValue = 0.0!
End Constructor

Constructor TSingle(ByVal NewValue As Single)
	Base()
	This.FValue = NewValue
End Constructor

Function TSingle.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TSingle.IsDefaultValue() As Boolean
	Return (This.FValue = 0.0!)
End Function

Property TSingle.IsInf() As Boolean
	Return (Abs(This.FValue) > This.MaxValue)
End Property

Property TSingle.IsNan() As Boolean
	Return (This.FValue <> This.FValue)
End Property

Property TSingle.Kind() As String
	Return "Single"
End Property

Operator TSingle.Let(ByVal NewValue As Single)
	This.FValue = NewValue
End Operator

Property TSingle.MaxValue() As Single
	Return 3.402823E+38!
End Property

Property TSingle.MinValue() As Single
	Return -3.402823E+38!
End Property

Property TSingle.Name() As String
	Return "TSingle"
End Property

Function TSingle.NativeValue() As Single Option("SSE")
	Return This.FValue
End Function

Operator =(ByRef Lhs As TSingle, ByVal Rhs As Single) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Single, ByRef Rhs As TSingle) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TSingle.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0.0!
End Sub

Property TSingle.Value() As Single
	Return This.FValue
End Property
