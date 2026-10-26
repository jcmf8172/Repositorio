''' @file TBoolean_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TBoolean

	Operator =(ByRef Lhs As TBoolean, ByVal Rhs As Boolean) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Boolean, ByRef Rhs As TBoolean) As Boolean
		Return Lhs = Rhs.Value
	End Operator

