''' @file TULongInt_Reset.BI
''' @brief Segmento Reset de TULongInt

	Sub TULongInt.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

