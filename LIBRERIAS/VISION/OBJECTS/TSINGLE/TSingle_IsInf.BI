''' @file TSingle_IsInf.BI
''' @brief Segmento IsInf de TSingle

	Property TSingle.IsInf() As Boolean
		Return (Abs(This.FValue) > This.MaxValue)
	End Property

