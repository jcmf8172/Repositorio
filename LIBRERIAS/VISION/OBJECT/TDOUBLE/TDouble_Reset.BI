''' @file TDouble_Reset.BI
''' @brief Segmento Reset de TDouble

	Sub TDouble.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0.0
	End Sub

