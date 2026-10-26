''' @file TInteger_Reset.BI
''' @brief Segmento Reset de TInteger

	Sub TInteger.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

