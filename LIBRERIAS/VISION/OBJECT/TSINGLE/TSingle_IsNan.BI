''' @file TSingle_IsNan.BI
''' @brief Segmento IsNan de TSingle

	Property TSingle.IsNan() As Boolean
		Return (This.FValue <> This.FValue)
	End Property

