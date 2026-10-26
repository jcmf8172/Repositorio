''' @file TLong_Clone.BI
''' @brief Segmento Clone de TLong

	Function TLong.Clone() As TObject Ptr
		Return New TLong(This.FValue)
	End Function

