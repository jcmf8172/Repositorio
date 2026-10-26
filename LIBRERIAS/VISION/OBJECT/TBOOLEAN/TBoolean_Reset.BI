''' @file TBoolean_Reset.BI
''' @brief Segmento Reset de TBoolean

	Sub TBoolean.Reset(ByVal DoReset As Boolean)
		If DoReset = False Then Return
		This.FValue = False
	End Sub

