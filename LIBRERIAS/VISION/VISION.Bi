''' ============================================================================
''' VISION.Bi - Libreria VISION consolidada en un unico fichero
''' ----------------------------------------------------------------------------
''' Namespace logico: VISION (los tipos quedan en el ambito global, sin bloque Namespace)
'''
''' Contenido:
'''   OBJECT        TObject, TValue y los tipos de dato:
'''                 TBoolean, TByte, TSByte, TShort, TUShort, TInteger,
'''                 TUInteger, TLong, TULong, TLongInt, TULongInt, TSingle,
'''                 TDouble, TString
'''   TERMINAL/UI   TRect
'''
''' Uso:
'''   #Include Once "VISION.Bi"
'''   fbc -i <carpeta de VISION.Bi> programa.bas
''' ============================================================================

#ifndef __VISION_BI__
#define __VISION_BI__

' ------------------------------------------------------------------------------
' TObject
' ------------------------------------------------------------------------------


Type TObject Extends Object
	Public:
		Declare Constructor()
		Declare Destructor()
		Declare Virtual Property Name() As String
		Declare Property Id() As String
		Declare Virtual Property ToString() As String
		Declare Virtual Function Clone() As TObject Ptr
End Type

Function TObject.Clone() As TObject Ptr
	Return 0
End Function

Constructor TObject()
	Base()
End Constructor

Destructor TObject()
End Destructor

Property TObject.Id() As String
	Return Hex(Cast(UInteger, @This))
End Property

Property TObject.Name() As String
	Return "TObject"
End Property

Property TObject.ToString() As String
	Return "[ " & This.Name & " ] Id: [ " & This.Id & " ]"
End Property

' ------------------------------------------------------------------------------
' TValue
' ------------------------------------------------------------------------------


Type TValue Extends TObject
	Protected:
		Declare Virtual Function GetValueText() As String
		Declare Virtual Function IsDefaultValue() As Boolean

	Public:
		Declare Constructor()
		Declare Destructor()
		Declare Virtual Property Kind() As String
		Declare Virtual Property IsDefault() As Boolean
		Declare Virtual Property IsEmpty() As Boolean
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Virtual Property ToString() As String Override
End Type

Constructor TValue()
	Base()
End Constructor

Destructor TValue()
End Destructor

Function TValue.GetValueText() As String
	Return "?"
End Function

Property TValue.IsDefault() As Boolean
	Return This.IsDefaultValue()
End Property

Function TValue.IsDefaultValue() As Boolean
	Return True
End Function

Property TValue.IsEmpty() As Boolean
	Return This.IsDefault
End Property

Property TValue.Kind() As String
	Return "Value"
End Property

Sub TValue.Reset(ByVal DoReset As Boolean)
	If DoReset = False Then Return
End Sub

Property TValue.ToString() As String
	Return "[ " & This.Name & " ] Value: [ " & This.GetValueText() & " ] Id: [ " & This.Id & " ]"
End Property

' ------------------------------------------------------------------------------
' TBoolean
' ------------------------------------------------------------------------------


Type TBoolean Extends TValue
	Protected:
		FValue As Boolean
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Boolean)
		Declare Constructor(ByRef Source As Const TBoolean)
		Declare Destructor()
		Declare Property Value() As Boolean
		Declare Operator Let(ByVal NewValue As Boolean)
		Declare Property Inverted(ByVal DoInvert As Boolean) As Boolean
		Declare Property AsInteger() As Integer
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Boolean
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Property TBoolean.AsInteger() As Integer
	If This.FValue Then Return 1
	Return 0
End Property

Operator TBoolean.Cast() As Boolean
	Return This.FValue
End Operator

Function TBoolean.Clone() As TObject Ptr
	Return New TBoolean(This.FValue)
End Function

Constructor TBoolean()
	Base()
	This.FValue = False
End Constructor

Constructor TBoolean(ByVal NewValue As Boolean)
	Base()
	This.FValue = NewValue
End Constructor

Constructor TBoolean(ByRef Source As Const TBoolean)
	Base()
	This.FValue = Source.FValue
End Constructor

Destructor TBoolean()
End Destructor

Function TBoolean.GetValueText() As String
	If This.FValue Then Return "True"
	Return "False"
End Function

Property TBoolean.Inverted(ByVal DoInvert As Boolean) As Boolean
	If DoInvert = False Then Return This.FValue
	Return (Not This.FValue)
End Property

Function TBoolean.IsDefaultValue() As Boolean
	Return (This.FValue = False)
End Function

Property TBoolean.Kind() As String
	Return "Boolean"
End Property

Operator TBoolean.Let(ByVal NewValue As Boolean)
	This.FValue = NewValue
End Operator

Property TBoolean.Name() As String
	Return "TBoolean"
End Property

Operator =(ByRef Lhs As TBoolean, ByVal Rhs As Boolean) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Boolean, ByRef Rhs As TBoolean) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TBoolean.Reset(ByVal DoReset As Boolean)
	If DoReset = False Then Return
	This.FValue = False
End Sub

Property TBoolean.Value() As Boolean
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TByte
' ------------------------------------------------------------------------------


Type TByte Extends TValue
	Protected:
		FValue As UByte
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UByte)
		Declare Destructor()
		Declare Property Value() As UByte
		Declare Operator Let(ByVal NewValue As UByte)
		Declare Property MinValue() As UByte
		Declare Property MaxValue() As UByte
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UByte
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TByte.Cast() As UByte
	Return This.FValue
End Operator

Function TByte.Clone() As TObject Ptr
	Return New TByte(This.FValue)
End Function

Constructor TByte()
	Base()
	This.FValue = 0
End Constructor

Constructor TByte(ByVal NewValue As UByte)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TByte()
End Destructor

Function TByte.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TByte.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TByte.Kind() As String
	Return "Byte"
End Property

Operator TByte.Let(ByVal NewValue As UByte)
	This.FValue = NewValue
End Operator

Property TByte.MaxValue() As UByte
	Return 255
End Property

Property TByte.MinValue() As UByte
	Return 0
End Property

Property TByte.Name() As String
	Return "TByte"
End Property

Operator =(ByRef Lhs As TByte, ByVal Rhs As UByte) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UByte, ByRef Rhs As TByte) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TByte.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TByte.Value() As UByte
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TSByte
' ------------------------------------------------------------------------------


Type TSByte Extends TValue
	Protected:
		FValue As Byte
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Byte)
		Declare Destructor()
		Declare Property Value() As Byte
		Declare Property MinValue() As Byte
		Declare Property MaxValue() As Byte
		Declare Operator Let(ByVal NewValue As Byte)
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Byte
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TSByte.Cast() As Byte
	Return This.FValue
End Operator

Function TSByte.Clone() As TObject Ptr
	Return New TSByte(This.FValue)
End Function

Constructor TSByte()
	Base()
	This.FValue = 0
End Constructor

Constructor TSByte(ByVal NewValue As Byte)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TSByte()
End Destructor

Function TSByte.GetValueText() As String
	Return Str(Cast(Short, This.FValue))
End Function

Function TSByte.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TSByte.Kind() As String
	Return "SByte"
End Property

Operator TSByte.Let(ByVal NewValue As Byte)
	This.FValue = NewValue
End Operator

Property TSByte.MaxValue() As Byte
	Return 127
End Property

Property TSByte.MinValue() As Byte
	Return -128
End Property

Property TSByte.Name() As String
	Return "TSByte"
End Property

Operator =(ByRef Lhs As TSByte, ByVal Rhs As Byte) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Byte, ByRef Rhs As TSByte) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TSByte.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TSByte.Value() As Byte
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TShort
' ------------------------------------------------------------------------------


Type TShort Extends TValue
	Protected:
		FValue As Short
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Short)
		Declare Destructor()
		Declare Property Value() As Short
		Declare Operator Let(ByVal NewValue As Short)
		Declare Property MinValue() As Short
		Declare Property MaxValue() As Short
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Short
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TShort.Cast() As Short
	Return This.FValue
End Operator

Function TShort.Clone() As TObject Ptr
	Return New TShort(This.FValue)
End Function

Constructor TShort()
	Base()
	This.FValue = 0
End Constructor

Constructor TShort(ByVal NewValue As Short)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TShort()
End Destructor

Function TShort.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TShort.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TShort.Kind() As String
	Return "Short"
End Property

Operator TShort.Let(ByVal NewValue As Short)
	This.FValue = NewValue
End Operator

Property TShort.MaxValue() As Short
	Return 32767
End Property

Property TShort.MinValue() As Short
	Return -32768
End Property

Property TShort.Name() As String
	Return "TShort"
End Property

Operator =(ByRef Lhs As TShort, ByVal Rhs As Short) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Short, ByRef Rhs As TShort) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TShort.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TShort.Value() As Short
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TUShort
' ------------------------------------------------------------------------------


Type TUShort Extends TValue
	Protected:
		FValue As UShort
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UShort)
		Declare Destructor()
		Declare Property Value() As UShort
		Declare Operator Let(ByVal NewValue As UShort)
		Declare Property MinValue() As UShort
		Declare Property MaxValue() As UShort
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UShort
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TUShort.Cast() As UShort
	Return This.FValue
End Operator

Function TUShort.Clone() As TObject Ptr
	Return New TUShort(This.FValue)
End Function

Constructor TUShort()
	Base()
	This.FValue = 0
End Constructor

Constructor TUShort(ByVal NewValue As UShort)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TUShort()
End Destructor

Function TUShort.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TUShort.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TUShort.Kind() As String
	Return "UShort"
End Property

Operator TUShort.Let(ByVal NewValue As UShort)
	This.FValue = NewValue
End Operator

Property TUShort.MaxValue() As UShort
	Return 65535
End Property

Property TUShort.MinValue() As UShort
	Return 0
End Property

Property TUShort.Name() As String
	Return "TUShort"
End Property

Operator =(ByRef Lhs As TUShort, ByVal Rhs As UShort) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UShort, ByRef Rhs As TUShort) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TUShort.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TUShort.Value() As UShort
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TInteger
' ------------------------------------------------------------------------------


Type TInteger Extends TValue
	Protected:
		FValue As Long
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Integer)
		Declare Destructor()
		Declare Property Value() As Integer
		Declare Operator Let(ByVal NewValue As Integer)
		Declare Property MinValue() As Integer
		Declare Property MaxValue() As Integer
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Integer
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TInteger.Cast() As Integer
	Return This.FValue
End Operator

Function TInteger.Clone() As TObject Ptr
	Return New TInteger(This.FValue)
End Function

Constructor TInteger()
	Base()
	This.FValue = 0
End Constructor

Constructor TInteger(ByVal NewValue As Integer)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TInteger()
End Destructor

Function TInteger.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TInteger.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TInteger.Kind() As String
	Return "Integer"
End Property

Operator TInteger.Let(ByVal NewValue As Integer)
	This.FValue = NewValue
End Operator

Property TInteger.MaxValue() As Integer
	Return &h7FFFFFFF
End Property

Property TInteger.MinValue() As Integer
	Return -2147483648
End Property

Property TInteger.Name() As String
	Return "TInteger"
End Property

Operator =(ByRef Lhs As TInteger, ByVal Rhs As Integer) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Integer, ByRef Rhs As TInteger) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TInteger.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TInteger.Value() As Integer
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TUInteger
' ------------------------------------------------------------------------------


Type TUInteger Extends TValue
	Protected:
		FValue As ULong
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As UInteger)
		Declare Destructor()
		Declare Property Value() As UInteger
		Declare Operator Let(ByVal NewValue As UInteger)
		Declare Property MinValue() As UInteger
		Declare Property MaxValue() As UInteger
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As UInteger
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TUInteger.Cast() As UInteger
	Return This.FValue
End Operator

Function TUInteger.Clone() As TObject Ptr
	Return New TUInteger(This.FValue)
End Function

Constructor TUInteger()
	Base()
	This.FValue = 0
End Constructor

Constructor TUInteger(ByVal NewValue As UInteger)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TUInteger()
End Destructor

Function TUInteger.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TUInteger.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TUInteger.Kind() As String
	Return "UInteger"
End Property

Operator TUInteger.Let(ByVal NewValue As UInteger)
	This.FValue = NewValue
End Operator

Property TUInteger.MaxValue() As UInteger
	Return &hFFFFFFFFu
End Property

Property TUInteger.MinValue() As UInteger
	Return 0
End Property

Property TUInteger.Name() As String
	Return "TUInteger"
End Property

Operator =(ByRef Lhs As TUInteger, ByVal Rhs As UInteger) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As UInteger, ByRef Rhs As TUInteger) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TUInteger.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TUInteger.Value() As UInteger
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TLong
' ------------------------------------------------------------------------------


Type TLong Extends TValue
	Protected:
		FValue As Long
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Long)
		Declare Destructor()
		Declare Property Value() As Long
		Declare Operator Let(ByVal NewValue As Long)
		Declare Property MinValue() As Long
		Declare Property MaxValue() As Long
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Long
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TLong.Cast() As Long
	Return This.FValue
End Operator

Function TLong.Clone() As TObject Ptr
	Return New TLong(This.FValue)
End Function

Constructor TLong()
	Base()
	This.FValue = 0
End Constructor

Constructor TLong(ByVal NewValue As Long)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TLong()
End Destructor

Function TLong.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TLong.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TLong.Kind() As String
	Return "Long"
End Property

Operator TLong.Let(ByVal NewValue As Long)
	This.FValue = NewValue
End Operator

Property TLong.MaxValue() As Long
	Return &h7FFFFFFF
End Property

Property TLong.MinValue() As Long
	Return &h80000000
End Property

Property TLong.Name() As String
	Return "TLong"
End Property

Operator =(ByRef Lhs As TLong, ByVal Rhs As Long) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Long, ByRef Rhs As TLong) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TLong.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TLong.Value() As Long
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TULong
' ------------------------------------------------------------------------------


Type TULong Extends TValue
	Protected:
		FValue As ULong
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As ULong)
		Declare Destructor()
		Declare Property Value() As ULong
		Declare Operator Let(ByVal NewValue As ULong)
		Declare Property MinValue() As ULong
		Declare Property MaxValue() As ULong
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As ULong
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TULong.Cast() As ULong
	Return This.FValue
End Operator

Function TULong.Clone() As TObject Ptr
	Return New TULong(This.FValue)
End Function

Constructor TULong()
	Base()
	This.FValue = 0
End Constructor

Constructor TULong(ByVal NewValue As ULong)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TULong()
End Destructor

Function TULong.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TULong.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TULong.Kind() As String
	Return "ULong"
End Property

Operator TULong.Let(ByVal NewValue As ULong)
	This.FValue = NewValue
End Operator

Property TULong.MaxValue() As ULong
	Return &hFFFFFFFFu
End Property

Property TULong.MinValue() As ULong
	Return 0
End Property

Property TULong.Name() As String
	Return "TULong"
End Property

Operator =(ByRef Lhs As TULong, ByVal Rhs As ULong) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As ULong, ByRef Rhs As TULong) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TULong.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TULong.Value() As ULong
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TLongInt
' ------------------------------------------------------------------------------


Type TLongInt Extends TValue
	Protected:
		FValue As LongInt
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As LongInt)
		Declare Destructor()
		Declare Property Value() As LongInt
		Declare Operator Let(ByVal NewValue As LongInt)
		Declare Property MinValue() As LongInt
		Declare Property MaxValue() As LongInt
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As LongInt
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TLongInt.Cast() As LongInt
	Return This.FValue
End Operator

Function TLongInt.Clone() As TObject Ptr
	Return New TLongInt(This.FValue)
End Function

Constructor TLongInt()
	Base()
	This.FValue = 0
End Constructor

Constructor TLongInt(ByVal NewValue As LongInt)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TLongInt()
End Destructor

Function TLongInt.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TLongInt.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TLongInt.Kind() As String
	Return "LongInt"
End Property

Operator TLongInt.Let(ByVal NewValue As LongInt)
	This.FValue = NewValue
End Operator

Property TLongInt.MaxValue() As LongInt
	Return Cast(LongInt, &h7FFFFFFFFFFFFFFF)
End Property

Property TLongInt.MinValue() As LongInt
	Return Cast(LongInt, &h8000000000000000)
End Property

Property TLongInt.Name() As String
	Return "TLongInt"
End Property

Operator =(ByRef Lhs As TLongInt, ByVal Rhs As LongInt) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As LongInt, ByRef Rhs As TLongInt) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TLongInt.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TLongInt.Value() As LongInt
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TULongInt
' ------------------------------------------------------------------------------


Type TULongInt Extends TValue
	Protected:
		FValue As ULongInt
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As ULongInt)
		Declare Destructor()
		Declare Property Value() As ULongInt
		Declare Operator Let(ByVal NewValue As ULongInt)
		Declare Property MinValue() As ULongInt
		Declare Property MaxValue() As ULongInt
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As ULongInt
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TULongInt.Cast() As ULongInt
	Return This.FValue
End Operator

Function TULongInt.Clone() As TObject Ptr
	Return New TULongInt(This.FValue)
End Function

Constructor TULongInt()
	Base()
	This.FValue = 0
End Constructor

Constructor TULongInt(ByVal NewValue As ULongInt)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TULongInt()
End Destructor

Function TULongInt.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TULongInt.IsDefaultValue() As Boolean
	Return (This.FValue = 0)
End Function

Property TULongInt.Kind() As String
	Return "ULongInt"
End Property

Operator TULongInt.Let(ByVal NewValue As ULongInt)
	This.FValue = NewValue
End Operator

Property TULongInt.MaxValue() As ULongInt
	Return Cast(ULongInt, &hFFFFFFFFFFFFFFFF)
End Property

Property TULongInt.MinValue() As ULongInt
	Return 0
End Property

Property TULongInt.Name() As String
	Return "TULongInt"
End Property

Operator =(ByRef Lhs As TULongInt, ByVal Rhs As ULongInt) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As ULongInt, ByRef Rhs As TULongInt) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TULongInt.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0
End Sub

Property TULongInt.Value() As ULongInt
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TSingle
' ------------------------------------------------------------------------------


Type TSingle Extends TValue
	Protected:
		FValue As Single
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Single)
		Declare Destructor()
		Declare Property Value() As Single
		Declare Operator Let(ByVal NewValue As Single)
		Declare Property MinValue() As Single
		Declare Property MaxValue() As Single
		Declare Property IsNan() As Boolean
		Declare Property IsInf() As Boolean
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Single
		Declare Function NativeValue() As Single Option("SSE")
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TSingle.Cast() As Single
	Return This.NativeValue()
End Operator

Function TSingle.Clone() As TObject Ptr
	Return New TSingle(This.FValue)
End Function

Constructor TSingle()
	Base()
	This.FValue = 0.0!
End Constructor

Constructor TSingle(ByVal NewValue As Single)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TSingle()
End Destructor

Function TSingle.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TSingle.IsDefaultValue() As Boolean
	Return (This.FValue = 0.0!)
End Function

Property TSingle.IsInf() As Boolean
	Return (Abs(This.FValue) > This.MaxValue)
End Property

Property TSingle.IsNan() As Boolean
	Return (This.FValue <> This.FValue)
End Property

Property TSingle.Kind() As String
	Return "Single"
End Property

Operator TSingle.Let(ByVal NewValue As Single)
	This.FValue = NewValue
End Operator

Property TSingle.MaxValue() As Single
	Return 3.402823E+38!
End Property

Property TSingle.MinValue() As Single
	Return -3.402823E+38!
End Property

Property TSingle.Name() As String
	Return "TSingle"
End Property

Function TSingle.NativeValue() As Single Option("SSE")
	Return This.FValue
End Function

Operator =(ByRef Lhs As TSingle, ByVal Rhs As Single) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Single, ByRef Rhs As TSingle) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TSingle.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0.0!
End Sub

Property TSingle.Value() As Single
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TDouble
' ------------------------------------------------------------------------------


Type TDouble Extends TValue
	Protected:
		FValue As Double
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As Double)
		Declare Destructor()
		Declare Property Value() As Double
		Declare Operator Let(ByVal NewValue As Double)
		Declare Property MinValue() As Double
		Declare Property MaxValue() As Double
		Declare Property IsNan() As Boolean
		Declare Property IsInf() As Boolean
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As Double
		Declare Function NativeValue() As Double Option("SSE")
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TDouble.Cast() As Double
	Return This.NativeValue()
End Operator

Function TDouble.Clone() As TObject Ptr
	Return New TDouble(This.FValue)
End Function

Constructor TDouble()
	Base()
	This.FValue = 0.0
End Constructor

Constructor TDouble(ByVal NewValue As Double)
	Base()
	This.FValue = NewValue
End Constructor

Destructor TDouble()
End Destructor

Function TDouble.GetValueText() As String
	Return Str(This.FValue)
End Function

Function TDouble.IsDefaultValue() As Boolean
	Return (This.FValue = 0.0)
End Function

Property TDouble.IsInf() As Boolean
	Return (Abs(This.FValue) > This.MaxValue)
End Property

Property TDouble.IsNan() As Boolean
	Return (This.FValue <> This.FValue)
End Property

Property TDouble.Kind() As String
	Return "Double"
End Property

Operator TDouble.Let(ByVal NewValue As Double)
	This.FValue = NewValue
End Operator

Property TDouble.MaxValue() As Double
	Return 1.7976931348623157E+308
End Property

Property TDouble.MinValue() As Double
	Return -1.7976931348623157E+308
End Property

Property TDouble.Name() As String
	Return "TDouble"
End Property

Function TDouble.NativeValue() As Double Option("SSE")
	Return This.FValue
End Function

Operator =(ByRef Lhs As TDouble, ByVal Rhs As Double) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As Double, ByRef Rhs As TDouble) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TDouble.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = 0.0
End Sub

Property TDouble.Value() As Double
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TString
' ------------------------------------------------------------------------------


Type TString Extends TValue
	Protected:
		FValue As String
		Declare Function GetValueText() As String Override
		Declare Function IsDefaultValue() As Boolean Override

	Public:
		Declare Constructor()
		Declare Constructor(ByVal NewValue As String)
		Declare Constructor(ByRef Source As Const TString)
		Declare Destructor()
		Declare Property Value() As String
		Declare Operator Let(ByVal NewValue As String)
		Declare Property Length() As Integer
		Declare Property Upper() As String
		Declare Property Lower() As String
		Declare Property Trimmed(ByVal DoTrim As Boolean) As String
		Declare Virtual Property Kind() As String Override
		Declare Virtual Property Name() As String Override
		Declare Virtual Property IsEmpty() As Boolean Override
		Declare Sub Reset(ByVal DoReset As Boolean)
		Declare Operator Cast() As String
		Declare Virtual Function Clone() As TObject Ptr Override
End Type

Operator TString.Cast() As String
	Return This.FValue
End Operator

Function TString.Clone() As TObject Ptr
	Return New TString(This.FValue)
End Function

Constructor TString()
	Base()
	This.FValue = ""
End Constructor

Constructor TString(ByVal NewValue As String)
	Base()
	This.FValue = NewValue
End Constructor

Constructor TString(ByRef Source As Const TString)
	Base()
	This.FValue = Source.FValue
End Constructor

Destructor TString()
End Destructor

Function TString.GetValueText() As String
	Return This.FValue
End Function

Function TString.IsDefaultValue() As Boolean
	Return (Len(This.FValue) = 0)
End Function

Property TString.IsEmpty() As Boolean
	Return (Len(This.FValue) = 0)
End Property

Property TString.Kind() As String
	Return "String"
End Property

Property TString.Length() As Integer
	Return Len(This.FValue)
End Property

Operator TString.Let(ByVal NewValue As String)
	This.FValue = NewValue
End Operator

Property TString.Lower() As String
	Return Lcase(This.FValue)
End Property

Property TString.Name() As String
	Return "TString"
End Property

Operator =(ByRef Lhs As TString, ByVal Rhs As String) As Boolean
	Return Lhs.Value = Rhs
End Operator

Operator =(ByVal Lhs As String, ByRef Rhs As TString) As Boolean
	Return Lhs = Rhs.Value
End Operator

Sub TString.Reset(ByVal DoReset As Boolean)
	If DoReset Then This.FValue = ""
End Sub

Property TString.Trimmed(ByVal DoTrim As Boolean) As String
	If DoTrim = False Then Return This.FValue
	Return Trim$(This.FValue)
End Property

Property TString.Upper() As String
	Return Ucase(This.FValue)
End Property

Property TString.Value() As String
	Return This.FValue
End Property

' ------------------------------------------------------------------------------
' TRect
' ------------------------------------------------------------------------------

Type TRect
	Col As Integer
	Row As Integer
	Width As Integer
	Height As Integer
	Declare Function Contains(ByVal HitCol As Integer, ByVal HitRow As Integer) As Boolean
	Declare Function Intersects(ByRef Other As TRect) As Boolean
	Declare Function IsValid() As Boolean
	Declare Function IsEmpty() As Boolean
	Declare Function Right() As Integer
	Declare Function Bottom() As Integer
	Declare Sub ClampToScreen(ByVal ScreenW As Integer, ByVal ScreenH As Integer)
	Declare Constructor()
	Declare Constructor(ByVal C As Integer, ByVal R As Integer, ByVal W As Integer, ByVal H As Integer)
End Type

Constructor TRect()
	This.Col = 0
	This.Row = 0
	This.Width = 0
	This.Height = 0
End Constructor

Constructor TRect(ByVal C As Integer, ByVal R As Integer, ByVal W As Integer, ByVal H As Integer)
	This.Col = C
	This.Row = R
	This.Width = W
	This.Height = H
End Constructor

Function TRect.Contains(ByVal HitCol As Integer, ByVal HitRow As Integer) As Boolean
	Return (HitCol >= This.Col) And (HitCol < This.Col + This.Width) And _
	       (HitRow >= This.Row) And (HitRow < This.Row + This.Height)
End Function

Function TRect.Intersects(ByRef Other As TRect) As Boolean
	Return Not ((This.Col + This.Width <= Other.Col) Or _
	            (Other.Col + Other.Width <= This.Col) Or _
	            (This.Row + This.Height <= Other.Row) Or _
	            (Other.Row + Other.Height <= This.Row))
End Function

Function TRect.IsValid() As Boolean
	Return (This.Width > 0) And (This.Height > 0)
End Function

Function TRect.IsEmpty() As Boolean
	Return (This.Width <= 0) Or (This.Height <= 0)
End Function

Function TRect.Right() As Integer
	Return This.Col + This.Width
End Function

Function TRect.Bottom() As Integer
	Return This.Row + This.Height
End Function

Sub TRect.ClampToScreen(ByVal ScreenW As Integer, ByVal ScreenH As Integer)
	If This.Col < 0 Then This.Col = 0
	If This.Row < 0 Then This.Row = 0
	If This.Col + This.Width > ScreenW Then This.Width = ScreenW - This.Col
	If This.Row + This.Height > ScreenH Then This.Height = ScreenH - This.Row
	If This.Width < 0 Then This.Width = 0
	If This.Height < 0 Then This.Height = 0
End Sub

#endif
