''' @file TSingle_Clone.BI
''' @brief Segmento Clone de TSingle

	Function TSingle.Clone() As TObject Ptr
		Return New TSingle(This.FValue)
	End Function

