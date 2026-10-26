''' @file TULong_Reset.BI
''' @brief Segmento Reset de TULong

	Sub TULong.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

