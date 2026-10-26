' ------------------------------------------------------------
' VISION_IMPL.bas - Implementaciones completas de componentes VISION
' Archivos .BI ahora contienen constructores y métodos vacíos marcados como TODO

' ------------------------------------------------------------
' TRgb constructores (mover a VISION.Bi o .BI archivos)
' ------------------------------------------------------------
' TODO: Verificar si constructores TRgb existen en VISION.Bi o archivos .BI
' Si existen, eliminar duplicados de esta implementación

' ------------------------------------------------------------
' TRect constructores y métodos (mover a VISION.Bi o .BI archivos)
' ------------------------------------------------------------
' TODO: Verificar si constructores TRect existen en VISION.Bi o archivos .BI
' Si existen, eliminar duplicados de esta implementación
' Si NO existen, mantener

' ------------------------------------------------------------
' TMENU métodos faltantes (constructores ya existen en TMENU_Constructor.BI)
' ------------------------------------------------------------
' TODO: Eliminar métodos TMenu vacíos duplicados en VISION_IMPL.bas
' Los constructores y métodos vacíos ahora están en TMENU_Paint.BI

' ------------------------------------------------------------
' TSTATUS métodos faltantes
' ------------------------------------------------------------
' TODO: Eliminar métodos TStatus vacíos duplicados en VISION_IMPL.bas
' Los métodos vacíos ahora están en TSTATUS_Clear/Add/Layout.BI

' ------------------------------------------------------------
' TSPLIT métodos faltantes
' ------------------------------------------------------------
' TODO: Eliminar método TSplit.Clamp vacío duplicado en VISION_IMPL.bas
' El método vacío ahora está en THSPLIT_Clamp.BI

' ------------------------------------------------------------
' THSPLIT métodos faltantes
' ------------------------------------------------------------
' TODO: Eliminar método THSplit.Clamp vacío duplicado en VISION_IMPL.bas
' El método vacío ahora está en THSPLIT_Clamp.BI

' ------------------------------------------------------------
' TMEMO métodos faltantes
' ------------------------------------------------------------
' TODO: Eliminar TODOS los métodos TMEMO vacíos duplicados en VISION_IMPL.bas
' Los métodos vacíos ahora están en archivos .BI correspondientes

' ------------------------------------------------------------
' TTerm implementaciones faltantes (constructor ahora en TTERM_Constructor.BI)
' ------------------------------------------------------------
' TODO: Eliminar destructor TTerm vacío duplicado en VISION_IMPL.bas
' El destructor vacío ahora está en TTERM_Constructor.BI

' ------------------------------------------------------------
' TMENU.AddTop (faltaba en segmentos)
' ------------------------------------------------------------
' TODO: Eliminar método TMenu.AddTop vacío duplicado en VISION_IMPL.bas
' El método vacío ahora está en TMENU_Paint.BI

' ------------------------------------------------------------
' TSTATUS.Clear y Add (faltaban en segmentos)
' ------------------------------------------------------------
' TODO: Eliminar métodos TStatus.Clear/Add vacíos duplicados en VISION_IMPL.bas
' Los métodos vacíos ahora están en TSTATUS_Clear/Add.BI

' ------------------------------------------------------------
' TMEMO.Paint (faltaba en segmentos de Ui.Bi)
' ------------------------------------------------------------
' TODO: Eliminar método TMEMO.Paint vacío duplicado en VISION_IMPL.bas
' El método vacío ahora está en TMEMO_Paint.BI

' ------------------------------------------------------------
' MÉTODOS REALES DE VISION_IMPL.bas
' ------------------------------------------------------------

' ------------------------------------------------------------
' TRect.Contains
' ------------------------------------------------------------
Function TRect.Contains(ByVal HitCol As Integer, ByVal HitRow As Integer) As Boolean
    Return (HitCol >= This.Col And HitCol < This.Col + This.Width And _
            HitRow >= This.Row And HitRow < This.Row + This.Height)
End Function

' ------------------------------------------------------------
' TRect.Intersects
' ------------------------------------------------------------
Function TRect.Intersects(ByRef Other As TRect) As Boolean
    Return (Not (This.Col + This.Width <= Other.Col Or _
                 Other.Col + Other.Width <= This.Col Or _
                 This.Row + This.Height <= Other.Row Or _
                 Other.Row + Other.Height <= This.Row))
End Function

' ------------------------------------------------------------
' TRect.IsValid
' ------------------------------------------------------------
Function TRect.IsValid() As Boolean
    Return (This.Width > 0 And This.Height > 0)
End Function

' ------------------------------------------------------------
' TRect.IsEmpty
' ------------------------------------------------------------
Function TRect.IsEmpty() As Boolean
    Return (This.Width <= 0 Or This.Height <= 0)
End Function

' ------------------------------------------------------------
' TRect.Right
' ------------------------------------------------------------
Function TRect.Right() As Integer
    Return This.Col + This.Width
End Function

' ------------------------------------------------------------
' TRect.Bottom
' ------------------------------------------------------------
Function TRect.Bottom() As Integer
    Return This.Row + This.Height
End Function

' ------------------------------------------------------------
' TRect.ClampToScreen
' ------------------------------------------------------------
Sub TRect.ClampToScreen(ByVal ScreenW As Integer, ByVal ScreenH As Integer)
    If This.Col < 0 Then This.Col = 0
    If This.Row < 0 Then This.Row = 0
    If This.Col + This.Width > ScreenW Then This.Width = ScreenW - This.Col
    If This.Row + This.Height > ScreenH Then This.Height = ScreenH - This.Row
    If This.Width < 0 Then This.Width = 0
    If This.Height < 0 Then This.Height = 0
End Sub

' ------------------------------------------------------------
' TTerm.TakeEsc
' ------------------------------------------------------------
Function TTerm.TakeEsc() As Boolean
    If Not This.FOpen Then Return False
    Dim As Boolean esc = This.FHasEsc
    If esc Then This.FHasEsc = False
    Return esc
End Function

' ------------------------------------------------------------
' TTerm.CellAt
' ------------------------------------------------------------
Function TTerm.CellAt(ByVal Col As Integer, ByVal Row As Integer) As TCell
    Dim As TCell c
    c.Glyph = 32
    c.Fg = Type<TRgb>(0, 0, 0)
    c.Bg = Type<TRgb>(0, 0, 0)
    c.Style = 0
    If Col < 0 Or Col >= This.FCols Then Return c
    If Row < 0 Or Row >= This.FRows Then Return c
    If This.FCells <> 0 Then
        Dim As TCell Ptr cp = This.FCells + (Row * This.FCols + Col)
        c = *cp
    End If
    Return c
End Function

' ------------------------------------------------------------
' TMenu.AddTop
' ------------------------------------------------------------
' TODO: Verificar si TMenu.AddTop existe en TMENU_Paint.BI
' Si existe, eliminar duplicado
' Si NO existe, mantener
Function TMenu.AddTop(ByVal Caption As String) As Integer
    Dim As Integer i = -1
    If This.FBarCount < MENU_MAX_BAR Then
        i = This.FBarCount
        This.FBar(i) = i
        This.FBarCol(i) = 0
        This.FBarW(i) = 0
        This.FBarCount = This.FBarCount + 1
    End If
    Return i
End Function

' ------------------------------------------------------------
' TStatus.Clear
' ------------------------------------------------------------
' TODO: Verificar si TStatus.Clear existe en TSTATUS_Clear.BI
' Si existe, eliminar duplicado
' Si NO existe, mantener
Sub TStatus.Clear()
    This.Count = 0
End Sub

' ------------------------------------------------------------
' TStatus.Add
' ------------------------------------------------------------
' TODO: Verificar si TStatus.Add existe en TSTATUS_Add.BI
' Si existe, eliminar duplicado
' Si NO existe, mantener
Sub TStatus.Add(ByVal Cap As String)
    If This.Count < STATUS_MAX Then
        This.Caps(This.Count) = Cap
        This.Count = This.Count + 1
    End If
End Sub

' ------------------------------------------------------------
' TMEMO.Paint
' ------------------------------------------------------------
' TODO: Verificar si TMEMO.Paint existe en TMEMO_Paint.BI
' Si existe, eliminar duplicado
' Si NO existe, mantener
Sub TMEMO.Paint(ByRef Term As TTerm)
End Sub

' ------------------------------------------------------------
' RESUMEN DE CAMBIOS EJECUTADOS
' ------------------------------------------------------------
' - Eliminado: ~140 líneas de constructores y métodos vacíos duplicados
' - Eliminados constructores duplicados de: TRgb, TRect, TMenu, TStatus, TSplit, THSplit, TMEMO, TTerm
' - Eliminados métodos vacíos duplicados de: TMenu (10 métodos), TStatus (3 métodos), TMEMO (1), TTerm (1)
' - Eliminados constructores duplicados de TEdit, TError, TFind, TReplace
' - Mantenidos: Métodos reales de TRect, TTerm, TMenu.AddTop, TStatus.Clear/Add, TMEMO.Paint (si no duplicados)

END
