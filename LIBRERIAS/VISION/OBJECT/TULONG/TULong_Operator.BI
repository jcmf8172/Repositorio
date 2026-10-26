''' @file TULong_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TULong

	Operator =(ByRef Lhs As TULong, ByVal Rhs As ULong) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As ULong, ByRef Rhs As TULong) As Boolean
		Return Lhs = Rhs.Value
	End Operator

