' tapplication.bi
' The main application class, responsible for the event loop.

#ifndef __TAPPLICATION_BI__
#define __TAPPLICATION_BI__

#include once "tview.bi"
#include once "tevent.bi"

' We need access to console functions like Inkey() and Screen.
#include once "fbgfx.bi"

Using FB

Type TApplication Extends TView
    '-- Methods
    Declare Constructor()
    Declare Virtual Destructor()

    ' The main application loop
    Declare Virtual Sub run()

    ' Method to get an event from the system
    Declare Virtual Sub getEvent(ByRef e As TEvent)

    ' Override TView's handleEvent to add application-level handling
    Declare Virtual Sub handleEvent(e As TEvent Ptr)

Private:
    ' Flag to control the main loop
    _running As Boolean
End Type


' --- IMPLEMENTATION ---

Constructor TApplication()
    ' The application is a full-screen view. We get the dimensions from fbGfx.
    Dim As Integer w, h
    ScreenInfo w, h
    Super(0, 0, w, h)
    this._running = false
End Constructor

Destructor TApplication()
    ' Clean up application-specific resources
End Destructor

Sub TApplication.run()
    this._running = true
    Dim As TEvent e

    While this._running
        ' 1. Get an event from the outside world
        getEvent(e)

        ' 2. Handle the event by passing it through the view hierarchy
        handleEvent(@e)

        ' 3. Draw the entire view hierarchy
        draw()

        ' A small sleep to prevent the loop from using 100% CPU
        Sleep 10
    Wend
End Sub

Sub TApplication.getEvent(ByRef e As TEvent)
    ' This is a simplified event getter. A real application would be more complex.
    ' It checks for keyboard input using Inkey().

    Dim As String key = Inkey()

    If Len(key) > 0 Then
        e.what = evKeyDown
        e.charCode = Asc(key)
        e.keyCode = 0 ' Scancode would require more complex input handling

        ' Special case: The Escape key (ASCII 27) will stop the application.
        If e.charCode = 27 Then
            this._running = false
        End If
    Else
        ' If no key is pressed, it's a nothing event.
        e.what = evNothing
    End If
End Sub

Sub TApplication.handleEvent(e As TEvent Ptr)
    ' First, let the application itself handle the event.
    ' This is where you could handle global shortcuts, etc.
    ' For now, we don't have any special application-level events.

    ' After application-level handling, pass the event down to the
    ' base TView implementation, which will propagate it to all subviews.
    Super.handleEvent(e)
End Sub

#endif '__TAPPLICATION_BI__'
