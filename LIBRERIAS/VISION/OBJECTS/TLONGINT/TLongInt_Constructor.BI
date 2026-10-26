''' @file TLongInt_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TLongInt

	Constructor TLongInt()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TLongInt(ByVal NewValue As LongInt)
		Base()
		This.FValue = NewValue
	End Constructor

