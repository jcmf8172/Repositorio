''' @file TULongInt_Clone.BI
''' @brief Segmento Clone de TULongInt

	Function TULongInt.Clone() As TObject Ptr
		Return New TULongInt(This.FValue)
	End Function

