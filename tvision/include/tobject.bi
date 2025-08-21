' tobject.bi
' The base object for the TVision library

#ifndef __TOBJECT_BI__
#define __TOBJECT_BI__

Type TObject Extends Object
    ' All objects in TVision will inherit from this one.
    ' It provides the base for polymorphism.

    ' The constructor. It does nothing for the base class.
    Declare Constructor()

    ' The virtual destructor. Ensures that derived class destructors are called correctly.
    Declare Virtual Destructor()
End Type

' Implementation of the constructor
Constructor TObject()
    ' Base constructor is empty
End Constructor

' Implementation of the destructor
Destructor TObject()
    ' Base destructor is empty
End Destructor

#endif '__TOBJECT_BI__
