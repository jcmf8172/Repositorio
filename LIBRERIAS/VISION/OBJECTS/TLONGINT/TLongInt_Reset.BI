''' @file TLongInt_Reset.BI
''' @brief Segmento Reset de TLongInt

	Sub TLongInt.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

