''' @file TString_Clone.BI
''' @brief Segmento Clone de TString

	Function TString.Clone() As TObject Ptr
		Return New TString(This.FValue)
	End Function

