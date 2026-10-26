''' @file TRECT_TYPE_IMPL.BI
''' @brief Implementaciones de metodos de TRect (definidas fuera del TYPE).

Function TRect_Contains(ByRef This As TRect, ByVal HitCol As Integer, ByVal HitRow As Integer) As Integer
    Return -(HitCol >= This.Col And HitCol < This.Col + This.Width And _
             HitRow >= This.Row And HitRow < This.Row + This.Height)
End Function

Function TRect_Intersects(ByRef This As TRect, ByRef Other As TRect) As Integer
    Return -(Not (This.Col + This.Width <= Other.Col Or _
                  Other.Col + Other.Width <= This.Col Or _
                  This.Row + This.Height <= Other.Row Or _
                  Other.Row + Other.Height <= This.Row))
End Function

Function TRect_IsValid(ByRef This As TRect) As Integer
    Return -(This.Width > 0 And This.Height > 0)
End Function

Function TRect_IsEmpty(ByRef This As TRect) As Integer
    Return -(This.Width <= 0 Or This.Height <= 0)
End Function

Function TRect_Right(ByRef This As TRect) As Integer
    Return This.Col + This.Width
End Function

Function TRect_Bottom(ByRef This As TRect) As Integer
    Return This.Row + This.Height
End Function

Sub TRect_ClampToScreen(ByRef This As TRect, ByVal ScreenW As Integer, ByVal ScreenH As Integer)
    If This.Col < 0 Then This.Col = 0
    If This.Row < 0 Then This.Row = 0
    If This.Col + This.Width > ScreenW Then This.Width = ScreenW - This.Col
    If This.Row + This.Height > ScreenH Then This.Height = ScreenH - This.Row
    If This.Width < 0 Then This.Width = 0
    If This.Height < 0 Then This.Height = 0
End Sub
