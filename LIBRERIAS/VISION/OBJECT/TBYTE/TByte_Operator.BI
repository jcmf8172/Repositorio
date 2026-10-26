''' @file TByte_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TByte

	Operator =(ByRef Lhs As TByte, ByVal Rhs As UByte) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As UByte, ByRef Rhs As TByte) As Boolean
		Return Lhs = Rhs.Value
	End Operator

