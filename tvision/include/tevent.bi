' tevent.bi
' Defines the event structure for the TVision library.

#ifndef __TEVENT_BI__
#define __TEVENT_BI__

Enum TEventType
    evNothing = 0       ' No event
    evKeyDown           ' A key was pressed
    evMouseDown         ' A mouse button was pressed
    evMouseUp           ' A mouse button was released
    evMouseMove         ' The mouse was moved
End Enum

Type TEvent
    what As TEventType  ' The type of event

    Union
        ' Keyboard event data
        Type
            keyCode As UShort ' The scancode of the key
            charCode As UShort ' The ASCII/Unicode character
        End Type

        ' Mouse event data
        Type
            x As Integer
            y As Integer
            buttons As UInteger ' State of the mouse buttons
        End Type
    End Union
End Type

#endif '__TEVENT_BI__'
