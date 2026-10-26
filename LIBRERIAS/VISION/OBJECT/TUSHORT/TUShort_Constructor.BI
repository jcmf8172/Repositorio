''' @file TUShort_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TUShort

	Constructor TUShort()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TUShort(ByVal NewValue As UShort)
		Base()
		This.FValue = NewValue
	End Constructor

