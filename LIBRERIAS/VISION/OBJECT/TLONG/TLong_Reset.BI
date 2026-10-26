''' @file TLong_Reset.BI
''' @brief Segmento Reset de TLong

	Sub TLong.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

