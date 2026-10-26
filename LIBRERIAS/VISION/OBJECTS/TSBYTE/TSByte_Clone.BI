''' @file TSByte_Clone.BI
''' @brief Segmento Clone de TSByte

	Function TSByte.Clone() As TObject Ptr
		Return New TSByte(This.FValue)
	End Function

