''' @file TDouble_IsNan.BI
''' @brief Segmento IsNan de TDouble

	Property TDouble.IsNan() As Boolean
		Return (This.FValue <> This.FValue)
	End Property

