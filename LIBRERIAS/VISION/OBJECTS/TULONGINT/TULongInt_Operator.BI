''' @file TULongInt_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TULongInt

	Operator =(ByRef Lhs As TULongInt, ByVal Rhs As ULongInt) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As ULongInt, ByRef Rhs As TULongInt) As Boolean
		Return Lhs = Rhs.Value
	End Operator

