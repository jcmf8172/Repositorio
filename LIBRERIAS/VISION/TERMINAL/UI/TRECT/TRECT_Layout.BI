''' @file TRECT_Layout.BI
''' @brief Metodos de ajuste de lay aut (layout) de TRect
'''

'' ' Metodo: ClampToScreen
'' @brief Ajusta el rect ngulo para que quepa dentro de los l mites de pantalla
'' @param This Referencia al rect ngulo
'' @param ScreenW Ancho de pantalla
'' @param ScreenH Alto de pantalla
Sub TRect_ClampToScreen(ByRef This As TRect, ByVal ScreenW As Integer, ByVal ScreenH As Integer)
    If This.Col < 0 Then This.Col = 0
    If This.Row < 0 Then This.Row = 0
    If This.Col + This.Width > ScreenW Then This.Width = ScreenW - This.Col
    If This.Row + This.Height > ScreenH Then This.Height = ScreenH - This.Row
    If This.Width < 0 Then This.Width = 0
    If This.Height < 0 Then This.Height = 0
End Sub
