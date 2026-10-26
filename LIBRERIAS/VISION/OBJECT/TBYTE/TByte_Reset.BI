''' @file TByte_Reset.BI
''' @brief Segmento Reset de TByte

	Sub TByte.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

