''' @file TDouble_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TDouble

	Constructor TDouble()
		Base()
		This.FValue = 0.0
	End Constructor

	Constructor TDouble(ByVal NewValue As Double)
		Base()
		This.FValue = NewValue
	End Constructor

