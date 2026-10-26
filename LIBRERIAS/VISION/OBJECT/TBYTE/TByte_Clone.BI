''' @file TByte_Clone.BI
''' @brief Segmento Clone de TByte

	Function TByte.Clone() As TObject Ptr
		Return New TByte(This.FValue)
	End Function

