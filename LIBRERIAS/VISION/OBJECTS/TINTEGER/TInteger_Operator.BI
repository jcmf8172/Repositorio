''' @file TInteger_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TInteger

	Operator =(ByRef Lhs As TInteger, ByVal Rhs As Integer) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Integer, ByRef Rhs As TInteger) As Boolean
		Return Lhs = Rhs.Value
	End Operator

