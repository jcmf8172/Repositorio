''' @file TUInteger_Clone.BI
''' @brief Segmento Clone de TUInteger

	Function TUInteger.Clone() As TObject Ptr
		Return New TUInteger(This.FValue)
	End Function

