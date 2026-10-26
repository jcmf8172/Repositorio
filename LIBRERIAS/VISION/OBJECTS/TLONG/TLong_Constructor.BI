''' @file TLong_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TLong

	Constructor TLong()
		Base()
		This.FValue = 0
	End Constructor

	Constructor TLong(ByVal NewValue As Long)
		Base()
		This.FValue = NewValue
	End Constructor

