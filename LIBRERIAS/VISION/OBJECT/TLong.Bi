''' ============================================================================
''' VISION / OBJECT / TLong
''' ============================================================================

#Include Once "OBJECT/TValue.Bi"

Type TLong Extends TValue
	Protected:
		FValue As Long
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Long)
		Declare Property Value() As Long
		Declare Operator Let(ByVal NewValue As Long)
		Declare Property MinValue() As Long
		Declare Property MaxValue() As Long
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Long
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TLong.Cast() As Long
	Return This.FValue
End Operator

Function TLong.Clone() As TObject Ptr
	Return New TLong(This.FValue)
End Function

Constructor TLong()
	Base()
	This.FValue = 0
End Constructor

Constructor TLong(ByVal NewValue As Long)
	Base()
	This.FValue = NewValue
End Constructor

Function TLong.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TLong.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TLong.Kind() As String
	Return "Long"
End Property

Operator TLong.Let(ByVal NewValue As Long)
	This.FValue = NewValue
End Operator

Property TLong.MaxValue() As Long
	Return &h7FFFFFFF
End Property

Property TLong.MinValue() As Long
	Return &h80000000
End Property

Property TLong.Name() As String
	Return "TLong"
End Property

Operator =(ByRef Lhs As TLong, ByVal Rhs As Long) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Long, ByRef Rhs As TLong) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TLong.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TLong.Value() As Long
	Return This.FValue
End Property
