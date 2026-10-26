''' @file TString_IsEmpty.BI
''' @brief Segmento IsEmpty de TString

	Property TString.IsEmpty() As Boolean
		Return (Len(This.FValue) = 0)
	End Property

