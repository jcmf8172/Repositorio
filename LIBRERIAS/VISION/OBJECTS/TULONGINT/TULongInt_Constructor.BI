''' @file TULongInt_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TULongInt

	Constructor TULongInt()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TULongInt(ByVal NewValue As ULongInt)
		Base()
		This.FValue = NewValue
	End Constructor

