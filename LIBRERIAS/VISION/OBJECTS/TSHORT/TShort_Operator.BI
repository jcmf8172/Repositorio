''' @file TShort_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TShort

	Operator =(ByRef Lhs As TShort, ByVal Rhs As Short) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Short, ByRef Rhs As TShort) As Boolean
		Return Lhs = Rhs.Value
	End Operator

