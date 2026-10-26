''' @file TSByte_Reset.BI
''' @brief Segmento Reset de TSByte

	Sub TSByte.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = 0
	End Sub

