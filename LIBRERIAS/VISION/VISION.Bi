''' ============================================================================
''' VISION.Bi - Libreria VISION (paraguas)
''' ----------------------------------------------------------------------------
''' Un fichero por objeto, cada uno con la declaracion del tipo y el cuerpo
''' de sus metodos:
'''   OBJECT/       TObject, TValue y los tipos de dato
'''   TERMINAL/UI   TRect
'''
''' Uso:
'''    #Include Once "VISION.Bi"
'''    fbc -i <carpeta de VISION> programa.bas
''' ============================================================================

#ifndef __VISION_BI__
#define __VISION_BI__

#Include Once "OBJECT/TObject.Bi"
#Include Once "OBJECT/TValue.Bi"
#Include Once "OBJECT/TBoolean.Bi"
#Include Once "OBJECT/TByte.Bi"
#Include Once "OBJECT/TSByte.Bi"
#Include Once "OBJECT/TShort.Bi"
#Include Once "OBJECT/TUShort.Bi"
#Include Once "OBJECT/TInteger.Bi"
#Include Once "OBJECT/TUInteger.Bi"
#Include Once "OBJECT/TLong.Bi"
#Include Once "OBJECT/TULong.Bi"
#Include Once "OBJECT/TLongInt.Bi"
#Include Once "OBJECT/TULongInt.Bi"
#Include Once "OBJECT/TSingle.Bi"
#Include Once "OBJECT/TDouble.Bi"
#Include Once "OBJECT/TString.Bi"
#Include Once "TERMINAL/UI/TRect.Bi"

#endif
