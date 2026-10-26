''' @file TSingle_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TSingle

	Operator =(ByRef Lhs As TSingle, ByVal Rhs As Single) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As Single, ByRef Rhs As TSingle) As Boolean
		Return Lhs = Rhs.Value
	End Operator

