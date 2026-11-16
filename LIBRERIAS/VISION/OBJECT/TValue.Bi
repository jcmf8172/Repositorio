''' ============================================================================
''' VISION / OBJECT / TValue
''' ============================================================================

#Include Once "OBJECT/TObject.Bi"

Type TValue Extends TObject
	Protected:
		Declare Virtual Function GetValueText() As String
		Declare Virtual Function IsDefaultValue() As Boolean

	Public:
		Declare Constructor()
		Declare Virtual Property Kind() As String
		Declare Virtual Property IsDefault() As Boolean
		Declare Virtual Property IsEmpty() As Boolean
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Virtual Property ToString() As String Override
End Type

Constructor TValue()
	Base()
End Constructor

Function TValue.GetValueText() As String
	Return "?"
End Function

Property TValue.IsDefault() As Boolean
	Return This.IsDefaultValue()
End Property

Function TValue.IsDefaultValue() As Boolean
	Return True
End Function

Property TValue.IsEmpty() As Boolean
	Return This.IsDefault
End Property

Property TValue.Kind() As String
	Return "Value"
End Property

Sub TValue.Reset(ByVal DoReset As Boolean)
	' La base no tiene estado propio que reiniciar
End Sub

Property TValue.ToString() As String
	Return "[ " & This.Name & " ] Value: [ " & This.GetValueText() & " ] Id: [ " & This.Id & " ]"
End Property
