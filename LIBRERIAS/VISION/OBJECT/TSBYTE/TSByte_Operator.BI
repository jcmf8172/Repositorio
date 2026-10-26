''' @file TSByte_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TSByte

	Operator =(ByRef Lhs As TSByte, ByVal Rhs As Byte) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Byte, ByRef Rhs As TSByte) As Boolean
		Return Lhs = Rhs.Value
	End Operator

