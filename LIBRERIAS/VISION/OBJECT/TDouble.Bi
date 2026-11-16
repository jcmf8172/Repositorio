''' ============================================================================
''' VISION / OBJECT / TDouble
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TDouble Extends TValue
	Protected:
		FValue As Double
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Double)
		Declare Property Value() As Double
		Declare Operator Let(ByVal NewValue As Double)
		Declare Property MinValue() As Double
		Declare Property MaxValue() As Double
		Declare Property IsNan() As Boolean
		Declare Property IsInf() As Boolean
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Double
		Declare Function NativeValue() As Double Option("SSE")
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TDouble.Cast() As Double
	Return This.NativeValue()
End Operator

Function TDouble.Clone() As TObject Ptr
	Return New TDouble(This.FValue)
End Function

Constructor TDouble()
	Base()
	This.FValue = 0.0
End Constructor

Constructor TDouble(ByVal NewValue As Double)
	Base()
	This.FValue = NewValue
End Constructor

Function TDouble.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TDouble.IsDefaultValue() As Boolean
	Return (This.FValue = 0.0)
End Function

Property TDouble.IsInf() As Boolean
	Return (Abs(This.FValue) > This.MaxValue)
End Property

Property TDouble.IsNan() As Boolean
	Return (This.FValue <> This.FValue)
End Property

Property TDouble.Kind() As String
	Return "Double"
End Property

Operator TDouble.Let(ByVal NewValue As Double)
	This.FValue = NewValue
End Operator

Property TDouble.MaxValue() As Double
	Return 1.7976931348623157E+308
End Property

Property TDouble.MinValue() As Double
	Return -1.7976931348623157E+308
End Property

Property TDouble.Name() As String
	Return "TDouble"
End Property

Function TDouble.NativeValue() As Double Option("SSE")
	Return This.FValue
End Function

Operator =(ByRef Lhs As TDouble, ByVal Rhs As Double) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Double, ByRef Rhs As TDouble) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TDouble.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0.0
End Sub

Property TDouble.Value() As Double
	Return This.FValue
End Property
