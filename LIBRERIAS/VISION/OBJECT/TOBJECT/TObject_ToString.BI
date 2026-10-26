''' @file TObject_ToString.BI
''' @brief Segmento ToString de TObject

	Property TObject.ToString() As String
		Return "[ " & This.Name & " ] Id: [ " & This.Id & " ]"
	End Property

