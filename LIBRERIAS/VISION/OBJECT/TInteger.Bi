''' ============================================================================
''' VISION / OBJECT / TInteger
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TInteger Extends TValue
	Protected:
		FValue As Long
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Integer)
		Declare Property Value() As Integer
		Declare Operator Let(ByVal NewValue As Integer)
		Declare Property MinValue() As Integer
		Declare Property MaxValue() As Integer
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Integer
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TInteger.Cast() As Integer
	Return This.FValue
End Operator

Function TInteger.Clone() As TObject Ptr
	Return New TInteger(This.FValue)
End Function

Constructor TInteger()
	Base()
	This.FValue = 0
End Constructor

Constructor TInteger(ByVal NewValue As Integer)
	Base()
	This.FValue = NewValue
End Constructor

Function TInteger.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TInteger.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TInteger.Kind() As String
	Return "Integer"
End Property

Operator TInteger.Let(ByVal NewValue As Integer)
	This.FValue = NewValue
End Operator

Property TInteger.MaxValue() As Integer
	Return &h7FFFFFFF
End Property

Property TInteger.MinValue() As Integer
	Return -2147483648
End Property

Property TInteger.Name() As String
	Return "TInteger"
End Property

Operator =(ByRef Lhs As TInteger, ByVal Rhs As Integer) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Integer, ByRef Rhs As TInteger) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TInteger.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TInteger.Value() As Integer
	Return This.FValue
End Property
