''' ============================================================================
''' VISION / OBJECT / TUInteger
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TUInteger Extends TValue
	Protected:
		FValue As ULong
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UInteger)
		Declare Property Value() As UInteger
		Declare Operator Let(ByVal NewValue As UInteger)
		Declare Property MinValue() As UInteger
		Declare Property MaxValue() As UInteger
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UInteger
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TUInteger.Cast() As UInteger
	Return This.FValue
End Operator

Function TUInteger.Clone() As TObject Ptr
	Return New TUInteger(This.FValue)
End Function

Constructor TUInteger()
	Base()
	This.FValue = 0
End Constructor

Constructor TUInteger(ByVal NewValue As UInteger)
	Base()
	This.FValue = NewValue
End Constructor

Function TUInteger.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TUInteger.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TUInteger.Kind() As String
	Return "UInteger"
End Property

Operator TUInteger.Let(ByVal NewValue As UInteger)
	This.FValue = NewValue
End Operator

Property TUInteger.MaxValue() As UInteger
	Return &hFFFFFFFFu
End Property

Property TUInteger.MinValue() As UInteger
	Return 0
End Property

Property TUInteger.Name() As String
	Return "TUInteger"
End Property

Operator =(ByRef Lhs As TUInteger, ByVal Rhs As UInteger) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UInteger, ByRef Rhs As TUInteger) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TUInteger.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TUInteger.Value() As UInteger
	Return This.FValue
End Property
