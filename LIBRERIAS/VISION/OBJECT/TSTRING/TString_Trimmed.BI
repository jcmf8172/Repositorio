''' @file TString_Trimmed.BI
''' @brief Segmento Trimmed de TString

	Property TString.Trimmed(ByVal DoTrim As Boolean) As String
		If DoTrim = False Then Return This.FValue
		Return Trim$(This.FValue)
	End Property

