''' @file TBoolean_GetValueText.BI
''' @brief Segmento GetValueText de TBoolean

	Function TBoolean.GetValueText() As String
		If This.FValue Then Return "True"
		Return "False"
	End Function

