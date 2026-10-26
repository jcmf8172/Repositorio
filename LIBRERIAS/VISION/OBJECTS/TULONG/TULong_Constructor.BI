''' @file TULong_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TULong

	Constructor TULong()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TULong(ByVal NewValue As ULong)
		Base()
		This.FValue = NewValue
	End Constructor

