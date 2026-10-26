''' @file TUShort_Clone.BI
''' @brief Segmento Clone de TUShort

	Function TUShort.Clone() As TObject Ptr
		Return New TUShort(This.FValue)
	End Function

