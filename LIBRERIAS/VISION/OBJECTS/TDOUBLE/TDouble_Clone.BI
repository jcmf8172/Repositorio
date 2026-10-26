''' @file TDouble_Clone.BI
''' @brief Segmento Clone de TDouble

	Function TDouble.Clone() As TObject Ptr
		Return New TDouble(This.FValue)
	End Function

