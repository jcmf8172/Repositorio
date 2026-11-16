''' ============================================================================
''' VISION / OBJECT / TObject
''' ============================================================================

Type TObject Extends Object
	Declare Constructor()
	Declare Virtual Property Name() As String
	Declare Property Id() As String
	Declare Virtual Property ToString() As String
	Declare Virtual Function Clone() As TObject Ptr
End Type

Function TObject.Clone() As TObject Ptr
	Return 0
End Function

Constructor TObject()
	Base()
End Constructor

Property TObject.Id() As String
	Return Hex(Cast(UInteger, @This))
End Property

Property TObject.Name() As String
	Return "TObject"
End Property

Property TObject.ToString() As String
	Return "[ " & This.Name & " ] Id: [ " & This.Id & " ]"
End Property
