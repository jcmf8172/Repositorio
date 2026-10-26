''' @file TRECT_Metrics.BI
''' @brief Metodos de medicion y propiedades de TRect
'''

'' ' Metodo: IsValid
'' @brief Verifica si el rect ngulo tiene dimensiones v lidas
'' @param This Referencia al rect ngulo
'' @return True si el rect ngulo es v lido, False en caso contrario
Function TRect_IsValid(ByRef This As TRect) As Integer
    Return -(This.Width > 0 And This.Height > 0)
End Function

'' ' Metodo: IsEmpty
'' @brief Verifica si el rect ngulo est vac o
'' @param This Referencia al rect ngulo
'' @return True si el rect ngulo est vac o, False en caso contrario
Function TRect_IsEmpty(ByRef This As TRect) As Integer
    Return -(This.Width <= 0 Or This.Height <= 0)
End Function

'' ' Metodo: Right
'' @brief Obtiene la coordenada derecha del rect ngulo
'' @param This Referencia al rect ngulo
'' @return Coordenada derecha (Col + Width)
Function TRect_Right(ByRef This As TRect) As Integer
    Return This.Col + This.Width
End Function

'' ' Metodo: Bottom
'' @brief Obtiene la coordenada inferior del rect ngulo
'' @param This Referencia al rect ngulo
'' @return Coordenada inferior (Row + Height)
Function TRect_Bottom(ByRef This As TRect) As Integer
    Return This.Row + This.Height
End Function
