Imports System
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Drawing.Text

Public Class TVision
    Inherits Control

    ' --- Propiedades y Campos Privados ---
    Private _font As Font
    Private _characterSize As SizeF
    Private _rows As Integer
    Private _columns As Integer
    Private _characterBuffer(,) As Char
    Private _textColor As Color = Color.White
    Private _backgroundColor As Color = Color.DarkBlue

    ' --- Propiedades Públicas ---
    Public ReadOnly Property Rows As Integer
        Get
            Return _rows
        End Get
    End Property

    Public ReadOnly Property Columns As Integer
        Get
            Return _columns
        End Get
    End Property

    ' --- Constructor ---
    Public Sub New()
        ' Usar una fuente monoespaciada para que todos los caracteres tengan el mismo ancho
        _font = New Font("Consolas", 12, FontStyle.Regular, GraphicsUnit.Point)

        ' Establecer estilos de control para un dibujado suave y personalizado
        Me.SetStyle(ControlStyles.UserPaint, True)
        Me.SetStyle(ControlStyles.AllPaintingInWmPaint, True)
        Me.SetStyle(ControlStyles.DoubleBuffer, True)
        Me.SetStyle(ControlStyles.ResizeRedraw, True)
        Me.SetStyle(ControlStyles.Selectable, True) ' Permitir que el control reciba foco

        ' Establecer el color de fondo por defecto
        Me.BackColor = _backgroundColor

        ' Calcular el tamaño de un solo carácter
        CalculateCharacterSize()

        ' Inicializar el búfer con un tamaño por defecto
        UpdateConsoleDimensions()
    End Sub

    ' --- Métodos Públicos ---
    ''' <summary>
    ''' Escribe un carácter en una posición específica de la consola.
    ''' </summary>
    Public Sub Write(character As Char, x As Integer, y As Integer)
        If x >= 0 AndAlso x < _columns AndAlso y >= 0 AndAlso y < _rows Then
            _characterBuffer(y, x) = character
            ' Forzar un redibujado solo en el área del carácter modificado para ser más eficiente
            Dim charRect As New Rectangle(CInt(x * _characterSize.Width), CInt(y * _characterSize.Height), CInt(_characterSize.Width), CInt(_characterSize.Height))
            Me.Invalidate(charRect)
        End If
    End Sub

    ''' <summary>
    ''' Escribe una cadena de texto a partir de una posición específica.
    ''' </summary>
    Public Sub Write(text As String, x As Integer, y As Integer)
        For i = 0 To text.Length - 1
            If (x + i) < _columns Then
                Write(text(i), x + i, y)
            End If
        Next
    End Sub

    ' --- Métodos Privados y Eventos Sobrescritos ---
    Private Sub CalculateCharacterSize()
        ' Medir el tamaño de un carácter usando un gráfico temporal
        Using g As Graphics = Me.CreateGraphics()
            _characterSize = g.MeasureString("W", _font) ' 'W' suele ser uno de los caracteres más anchos
        End Using
    End Sub

    Private Sub UpdateConsoleDimensions()
        If ClientSize.Width > 0 AndAlso ClientSize.Height > 0 AndAlso _characterSize.Width > 0 AndAlso _characterSize.Height > 0 Then
            _columns = CInt(Math.Floor(ClientSize.Width / _characterSize.Width))
            _rows = CInt(Math.Floor(ClientSize.Height / _characterSize.Height))
        Else
            _columns = 80
            _rows = 25
        End If

        ' Redimensionar el array de caracteres, conservando el contenido antiguo si es posible
        _characterBuffer = CType(Utils.ResizeArray(_characterBuffer, New Integer() {_rows - 1, _columns - 1}), Char(,))
    End Sub

    Protected Overrides Sub OnPaint(e As PaintEventArgs)
        MyBase.OnPaint(e)

        ' Rellenar el fondo
        e.Graphics.Clear(_backgroundColor)

        ' Dibujar cada carácter del búfer
        If _characterBuffer IsNot Nothing Then
            For row As Integer = 0 To _rows - 1
                For col As Integer = 0 To _columns - 1
                    Dim character As Char = _characterBuffer(row, col)
                    If character <> Chr(0) Then ' No dibujar caracteres nulos
                        Dim point As New PointF(col * _characterSize.Width, row * _characterSize.Height)
                        e.Graphics.DrawString(character.ToString(), _font, New SolidBrush(_textColor), point)
                    End If
                Next
            Next
        End If
    End Sub

    Protected Overrides Sub OnResize(e As EventArgs)
        MyBase.OnResize(e)
        ' Cuando el control cambia de tamaño, actualizamos las dimensiones y el búfer
        UpdateConsoleDimensions()
    End Sub

    Protected Overrides Sub OnKeyPress(e As KeyPressEventArgs)
        MyBase.OnKeyPress(e)
        ' Ejemplo: Muestra la tecla presionada en una ubicación fija
        Write("Tecla presionada: " & e.KeyChar & " ", 5, 10)
        e.Handled = True
    End Sub

    Protected Overrides Sub OnGotFocus(e As EventArgs)
        MyBase.OnGotFocus(e)
        ' Opcional: Dibuja un borde o cambia algo para indicar que tiene el foco
        Me.Invalidate() ' Redibuja para mostrar cambios visuales de foco
    End Sub

    Protected Overrides Sub OnLostFocus(e As EventArgs)
        MyBase.OnLostFocus(e)
        ' Opcional: Remueve el borde o revierte los cambios de foco
        Me.Invalidate() ' Redibuja para quitar los cambios visuales de foco
    End Sub
End Class

' Clase de utilidad para redimensionar arrays, ya que VB.NET no tiene un método integrado simple.
Public Module Utils
    Public Function ResizeArray(ByVal original As Array, ByVal newSizes() As Integer) As Array
        If original Is Nothing Then
            Return Array.CreateInstance(GetType(Char), newSizes(0) + 1, newSizes(1) + 1)
        End If

        Dim newArray As Array = Array.CreateInstance(original.GetType().GetElementType(), newSizes)
        Dim minRows As Integer = Math.Min(original.GetLength(0), newArray.GetLength(0))
        Dim minCols As Integer = Math.Min(original.GetLength(1), newArray.GetLength(1))

        For i As Integer = 0 To minRows - 1
            For j As Integer = 0 To minCols - 1
                newArray.SetValue(original.GetValue(i, j), i, j)
            Next
        Next

        Return newArray
    End Function
End Module
