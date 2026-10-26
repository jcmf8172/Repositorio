''' @file TBoolean_Inverted.BI
''' @brief Segmento Inverted de TBoolean

	Property TBoolean.Inverted(ByVal DoInvert As Boolean) As Boolean
		If DoInvert = False Then Return This.FValue
		Return (Not This.FValue)
	End Property

