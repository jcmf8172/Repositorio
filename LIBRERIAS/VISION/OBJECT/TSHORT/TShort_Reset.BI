''' @file TShort_Reset.BI
''' @brief Segmento Reset de TShort

	Sub TShort.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

