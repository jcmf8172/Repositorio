Imports System
Imports System.Drawing
Imports System.Windows.Forms

Public Class Form1
    Inherits Form

    ' Declarar el control a nivel de formulario para poder acceder a él desde otros métodos
    Private WithEvents tVisionControl As TVision

    Public Sub New()
        InitializeComponent()
    End Sub

#Region " Código generado por el Diseñador de Windows Forms "

    Private components As System.ComponentModel.IContainer

    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.tVisionControl = New TVision()

        Me.SuspendLayout()

        '--- Configuración del Control TVision ---
        Me.tVisionControl.Dock = System.Windows.Forms.DockStyle.Fill
        Me.tVisionControl.Location = New System.Drawing.Point(0, 0)
        Me.tVisionControl.Name = "tVisionControl"
        Me.tVisionControl.TabIndex = 0
        Me.tVisionControl.Text = "TVision" ' Texto interno, no visible

        '--- Configuración del Formulario ---
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(784, 561)
        Me.Controls.Add(Me.tVisionControl)
        Me.Name = "Form1"
        Me.Text = "TVision Demo"

        Me.ResumeLayout(False)
    End Sub

#End Region

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' Ejemplo de cómo escribir en la consola cuando el formulario se carga
        tVisionControl.Write("¡Bienvenido a la Consola TVision!", 5, 2)
        tVisionControl.Write("=================================", 5, 3)
        tVisionControl.Write("Esta es una demostración de un control personalizado", 5, 5)
        tVisionControl.Write("que emula una pantalla de texto clásica.", 5, 6)
        tVisionControl.Write("Presione una tecla...", 5, 8)
    End Sub
End Class
