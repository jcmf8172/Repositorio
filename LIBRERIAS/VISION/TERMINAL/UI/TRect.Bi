''' ============================================================================
''' VISION / TERMINAL / UI / TRect
''' ============================================================================

Type TRect
	Col As Integer
	Row As Integer
	Width As Integer
	Height As Integer
	Declare Function Contains(ByVal HitCol As Integer, ByVal HitRow As Integer) As Boolean
	Declare Function Intersects(ByRef Other As TRect) As Boolean
	Declare Function IsValid() As Boolean
	Declare Function IsEmpty() As Boolean
	Declare Function Right() As Integer
	Declare Function Bottom() As Integer
	Declare Sub ClampToScreen(ByVal ScreenW As Integer, ByVal ScreenH As Integer)
	Declare Constructor()
	Declare Constructor(ByVal C As Integer, ByVal R As Integer, ByVal W As Integer, ByVal H As Integer)
End Type

Constructor TRect()
	This.Col = 0
	This.Row = 0
	This.Width = 0
	This.Height = 0
End Constructor

Constructor TRect(ByVal C As Integer, ByVal R As Integer, ByVal W As Integer, ByVal H As Integer)
	This.Col = C
	This.Row = R
	This.Width = W
	This.Height = H
End Constructor

Function TRect.Contains(ByVal HitCol As Integer, ByVal HitRow As Integer) As Boolean
	Return (HitCol >= This.Col) And (HitCol < This.Col + This.Width) And _
	       (HitRow >= This.Row) And (HitRow < This.Row + This.Height)
End Function

Function TRect.Intersects(ByRef Other As TRect) As Boolean
	Return Not ((This.Col + This.Width <= Other.Col) Or _
	            (Other.Col + Other.Width <= This.Col) Or _
	            (This.Row + This.Height <= Other.Row) Or _
	            (Other.Row + Other.Height <= This.Row))
End Function

Function TRect.IsValid() As Boolean
	Return (This.Width > 0) And (This.Height > 0)
End Function

Function TRect.IsEmpty() As Boolean
	Return (This.Width <= 0) Or (This.Height <= 0)
End Function

Function TRect.Right() As Integer
	Return This.Col + This.Width
End Function

Function TRect.Bottom() As Integer
	Return This.Row + This.Height
End Function

Sub TRect.ClampToScreen(ByVal ScreenW As Integer, ByVal ScreenH As Integer)
	If This.Col < 0 Then This.Col = 0
	If This.Row < 0 Then This.Row = 0
	If This.Col + This.Width > ScreenW Then This.Width = ScreenW - This.Col
	If This.Row + This.Height > ScreenH Then This.Height = ScreenH - This.Row
	If This.Width < 0 Then This.Width = 0
	If This.Height < 0 Then This.Height = 0
End Sub
