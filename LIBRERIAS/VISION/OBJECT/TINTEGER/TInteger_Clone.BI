''' @file TInteger_Clone.BI
''' @brief Segmento Clone de TInteger

	Function TInteger.Clone() As TObject Ptr
		Return New TInteger(This.FValue)
	End Function

