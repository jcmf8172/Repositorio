''' @file TBoolean_Constructor.BI (3 sobrecargas)
''' @brief Segmento Constructor de TBoolean

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

