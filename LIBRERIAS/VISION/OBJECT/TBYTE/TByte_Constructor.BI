''' @file TByte_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TByte

	Constructor TByte()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TByte(ByVal NewValue As UByte)
		Base()
		This.FValue = NewValue
	End Constructor

