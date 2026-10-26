''' @file TBoolean_Clone.BI
''' @brief Segmento Clone de TBoolean

	Function TBoolean.Clone() As TObject Ptr
		Return New TBoolean(This.FValue)
	End Function

