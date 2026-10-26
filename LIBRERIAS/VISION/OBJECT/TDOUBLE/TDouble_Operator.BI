''' @file TDouble_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TDouble

	Operator =(ByRef Lhs As TDouble, ByVal Rhs As Double) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Double, ByRef Rhs As TDouble) As Boolean
		Return Lhs = Rhs.Value
	End Operator

