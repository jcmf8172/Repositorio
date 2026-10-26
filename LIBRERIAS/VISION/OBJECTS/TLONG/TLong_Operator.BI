''' @file TLong_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TLong

	Operator =(ByRef Lhs As TLong, ByVal Rhs As Long) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Long, ByRef Rhs As TLong) As Boolean
		Return Lhs = Rhs.Value
	End Operator

