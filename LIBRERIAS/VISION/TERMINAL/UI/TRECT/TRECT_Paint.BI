''' @file TRECT_Paint.BI
''' @brief Metodos de deteccion de colisiones y renderizado de TRect
'''

'' ' Metodo: Contains
'' @brief Verifica si un punto (HitCol, HitRow) se encuentra dentro del rect ngulo
'' @param This Referencia al rect ngulo
'' @param HitCol Columna de prueba
'' @param HitRow Fila de prueba
'' @return True si el punto est dentro del rect ngulo, False en caso contrario
Function TRect_Contains(ByRef This As TRect, ByVal HitCol As Integer, ByVal HitRow As Integer) As Integer
    Return -(HitCol >= This.Col And HitCol < This.Col + This.Width And _
             HitRow >= This.Row And HitRow < This.Row + This.Height)
End Function

'' ' Metodo: Intersects
'' @brief Verifica si un rect ngulo (Other) intersecta con este
'' @param This Referencia al rect ngulo actual
'' @param Other Rect ngulo a verificar
'' @return True si hay interseccin, False en caso contrario
Function TRect_Intersects(ByRef This As TRect, ByRef Other As TRect) As Integer
    Return -(Not (This.Col + This.Width <= Other.Col Or _
                  Other.Col + Other.Width <= This.Col Or _
                  This.Row + This.Height <= Other.Row Or _
                  Other.Row + Other.Height <= This.Row))
End Function
