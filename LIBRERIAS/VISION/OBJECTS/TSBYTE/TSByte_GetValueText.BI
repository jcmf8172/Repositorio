''' @file TSByte_GetValueText.BI
''' @brief Segmento GetValueText de TSByte

	Function TSByte.GetValueText() As String
		Return Str(Cast(Short, This.FValue))
	End Function

