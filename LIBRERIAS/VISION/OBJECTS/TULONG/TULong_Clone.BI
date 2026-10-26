''' @file TULong_Clone.BI
''' @brief Segmento Clone de TULong

	Function TULong.Clone() As TObject Ptr
		Return New TULong(This.FValue)
	End Function

