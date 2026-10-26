''' @file TString_Constructor.BI (3 sobrecargas)
''' @brief Segmento Constructor de TString

	Constructor TString()
		Base()
		This.FValue = ""
	End Constructor

	Constructor TString(ByVal NewValue As String)
		Base()
		This.FValue = NewValue
	End Constructor

	Constructor TString(ByRef Source As Const TString)
		Base()
		This.FValue = Source.FValue
	End Constructor

