''' @file TObject_Id.BI
''' @brief Segmento Id de TObject

	Property TObject.Id() As String
		Return Hex(Cast(UInteger, @This))
	End Property

