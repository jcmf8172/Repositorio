''' @file TUShort_Reset.BI
''' @brief Segmento Reset de TUShort

	Sub TUShort.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

