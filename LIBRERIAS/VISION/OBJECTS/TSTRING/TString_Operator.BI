''' @file TString_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TString

	Operator =(ByRef Lhs As TString, ByVal Rhs As String) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As String, ByRef Rhs As TString) As Boolean
		Return Lhs = Rhs.Value
	End Operator

