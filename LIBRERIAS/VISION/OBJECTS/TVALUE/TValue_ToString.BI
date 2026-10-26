''' @file TValue_ToString.BI
''' @brief Segmento ToString de TValue

	Property TValue.ToString() As String
		Return "[ " & This.Name & " ] Value: [ " & This.GetValueText() & " ] Id: [ " & This.Id & " ]"
	End Property

