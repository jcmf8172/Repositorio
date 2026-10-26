''' @file TDouble_IsInf.BI
''' @brief Segmento IsInf de TDouble

	Property TDouble.IsInf() As Boolean
		Return (Abs(This.FValue) > This.MaxValue)
	End Property

