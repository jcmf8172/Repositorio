''' @file TString_Reset.BI
''' @brief Segmento Reset de TString

	Sub TString.Reset(ByVal DoReset As Boolean)
		If DoReset Then This.FValue = ""
	End Sub

