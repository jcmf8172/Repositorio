''' @file TLongInt_Clone.BI
''' @brief Segmento Clone de TLongInt

	Function TLongInt.Clone() As TObject Ptr
		Return New TLongInt(This.FValue)
	End Function

