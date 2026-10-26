''' @file TBoolean_AsInteger.BI
''' @brief Segmento AsInteger de TBoolean

	Property TBoolean.AsInteger() As Integer
		If This.FValue Then Return 1
		Return 0
	End Property

