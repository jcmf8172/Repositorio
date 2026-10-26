''' @file TSingle_Constructor.BI (2 sobrecargas)
''' @brief Segmento Constructor de TSingle

	Constructor TSingle()
		Base()
		This.FValue = 0.0!
	End Constructor

	Constructor TSingle(ByVal NewValue As Single)
		Base()
		This.FValue = NewValue
	End Constructor

