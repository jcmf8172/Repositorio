''' @file TShort_Clone.BI
''' @brief Segmento Clone de TShort

	Function TShort.Clone() As TObject Ptr
		Return New TShort(This.FValue)
	End Function

