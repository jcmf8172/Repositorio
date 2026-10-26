''' @file TRECT_TYPE.BI
''' @brief Segmento TYPE de TRECT.

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
