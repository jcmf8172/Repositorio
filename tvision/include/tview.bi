' tview.bi
' The base class for all visual components (views).

#ifndef __TVIEW_BI__
#define __TVIEW_BI__

#include once "tobject.bi"

' Forward declaration for the event type. This allows us to use
' TEvent Ptr without needing the full definition of TEvent yet.
Type TEvent

Type TView Extends TObject
    '-- Public Properties
    x As Integer
    y As Integer
    width As Integer
    height As Integer

    owner As TView Ptr  ' The view that contains this one
    next As TView Ptr   ' The next view in the owner's subview list

    visible As Boolean

    '-- Methods
    Declare Constructor(ax As Integer, ay As Integer, awidth As Integer, aheight As Integer)
    Declare Virtual Destructor()

    ' Core virtual methods for derived classes to implement
    Declare Virtual Sub draw()
    Declare Virtual Sub handleEvent(e As TEvent Ptr)

    ' Method to insert a subview into this view's hierarchy
    Declare Sub insert(view As TView Ptr)

Private:
    ' Head of the linked list of sub-views owned by this view
    first As TView Ptr
End Type


' --- IMPLEMENTATION ---

Constructor TView(ax As Integer, ay As Integer, awidth As Integer, aheight As Integer)
    this.x = ax
    this.y = ay
    this.width = awidth
    this.height = aheight
    this.owner = null
    this.next = null
    this.first = null
    this.visible = true
End Constructor

Destructor TView()
    ' A real implementation would need to safely delete all subviews.
    ' To do this properly, we would iterate through the `first` linked list
    ' and delete each view. For this example, we keep it simple.
    Dim As TView Ptr current = first
    Dim As TView Ptr temp
    While current <> null
        temp = current->next
        Delete current
        current = temp
    Wend
End Destructor

Sub TView.draw()
    ' Base draw method. It simply calls draw() on all its subviews.
    ' Derived views will add their own drawing logic here *before*
    ' calling the base method to ensure subviews are drawn on top.
    If visible Then
        Dim As TView Ptr current = first
        While current <> null
            current->draw()
            current = current->next
        Wend
    End If
End Sub

Sub TView.handleEvent(e As TEvent Ptr)
    ' Base event handler. By default, it passes the event to its subviews.
    If visible Then
        Dim As TView Ptr current = first
        While current <> null
            current->handleEvent(e)
            current = current->next
        Wend
    End If
End Sub

Sub TView.insert(view As TView Ptr)
    ' Inserts a view into this view's subview list.
    ' The new view becomes the head of the linked list.
    If view <> null Then
        view->owner = @this
        view->next = this.first
        this.first = view
    End If
End Sub

#endif '__TVIEW_BI__'
