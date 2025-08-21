' helloworld.bas
' A simple example demonstrating the TVision framework for FreeBasic.
'
' To compile from the `examples` directory:
' fbc -i ../include helloworld.bas

#include once "tapplication.bi"

' --- Custom Window Class Definition ---
' A simple window that draws a border and some text.
' It inherits from TView, so it can be part of the view hierarchy.
Type TMyWindow Extends TView
    Declare Constructor(ax As Integer, ay As Integer, awidth As Integer, aheight As Integer)
    Declare Virtual Destructor()
    Declare Virtual Sub draw()
End Type

Constructor TMyWindow(ax As Integer, ay As Integer, awidth As Integer, aheight As Integer)
    ' Call the parent constructor to set up the basic view properties
    Super(ax, ay, awidth, aheight)
End Constructor

Destructor TMyWindow()
    ' Nothing special to do here for this simple class
End Destructor

' This is where our custom window defines its appearance.
Sub TMyWindow.draw()
    ' Set the color for the window body
    Color 7, 1 ' Light Grey on Blue

    ' Clear the window area with the background color
    For i As Integer = 0 To this.height - 1
        Locate this.y + i + 1, this.x + 1
        Print String(this.width, " ")
    Next

    ' Draw the border of the window using box-drawing characters
    ' Top line
    Locate this.y + 1, this.x + 2
    Print String(this.width - 2, Chr(196))
    ' Bottom line
    Locate this.y + this.height, this.x + 2
    Print String(this.width - 2, Chr(196))
    ' Left and right lines
    For i As Integer = 1 To this.height - 1
        Locate this.y + i, this.x + 1: Print Chr(179)
        Locate this.y + i, this.x + this.width: Print Chr(179)
    Next

    ' Corners
    Locate this.y + 1, this.x + 1: Print Chr(218) ' Top-left
    Locate this.y + 1, this.x + this.width: Print Chr(191) ' Top-right
    Locate this.y + this.height, this.x + 1: Print Chr(192) ' Bottom-left
    Locate this.y + this.height, this.x + this.width: Print Chr(217) ' Bottom-right

    ' Print the title in the center of the top border
    Dim As String title = " Hello World "
    Locate this.y + 1, this.x + (this.width - Len(title)) / 2
    Color 15, 4 ' Bright White on Red for the title
    Print title
    Color 7, 1 ' Reset to window body color

    ' Print the text inside the window
    Locate this.y + 3, this.x + 3
    Print "This is a TVision demo in FreeBasic."
    Locate this.y + 5, this.x + 3
    Print "Press ESC to quit."

    ' Call the base class draw method. This is crucial as it will
    ' draw any subviews that might have been added to this window.
    Super.draw()
End Sub


' --- Main Program Entry Point ---
Sub Main()
    ' Set up the screen for 80x25 text mode.
    Screen 0
    Width 80, 25

    ' Create the main application object.
    ' We use a pointer and New/Delete for dynamic object management.
    Dim app As TApplication Ptr = New TApplication()

    ' Create our custom window.
    ' Position it at (10, 5) with a size of (40, 10).
    Dim window As TMyWindow Ptr = New TMyWindow(10, 5, 40, 10)

    ' Insert the window into the application's view hierarchy.
    ' The application now "owns" the window.
    app->insert(window)

    ' Start the application's main event loop.
    ' This will run until the user presses ESC (handled in TApplication).
    app->run()

    ' Clean up memory. The TApplication destructor is responsible for
    ' deleting all the views that were inserted into it, including our window.
    Delete app

    ' The console is cleared automatically by FreeBasic on program exit.
    Print "Application terminated."
End Sub

' Start the program
Main()
