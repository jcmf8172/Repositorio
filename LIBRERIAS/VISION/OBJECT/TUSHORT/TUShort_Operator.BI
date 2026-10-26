''' @file TUShort_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TUShort

	Operator =(ByRef Lhs As TUShort, ByVal Rhs As UShort) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As UShort, ByRef Rhs As TUShort) As Boolean
		Return Lhs = Rhs.Value
	End Operator

