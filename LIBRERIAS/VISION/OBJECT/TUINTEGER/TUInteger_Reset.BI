''' @file TUInteger_Reset.BI
''' @brief Segmento Reset de TUInteger

	Sub TUInteger.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

