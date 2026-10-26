''' @file TLongInt_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TLongInt

	Operator =(ByRef Lhs As TLongInt, ByVal Rhs As LongInt) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As LongInt, ByRef Rhs As TLongInt) As Boolean
		Return Lhs = Rhs.Value
	End Operator

