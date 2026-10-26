''' @file TString_IsDefaultValue.BI
''' @brief Segmento IsDefaultValue de TString

	Function TString.IsDefaultValue() As Boolean
		Return (Len(This.FValue) = 0)
	End Function

