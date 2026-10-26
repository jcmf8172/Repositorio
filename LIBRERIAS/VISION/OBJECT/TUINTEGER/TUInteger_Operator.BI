''' @file TUInteger_Operator.BI (2 sobrecargas)
''' @brief Segmento Operator de TUInteger

	Operator =(ByRef Lhs As TUInteger, ByVal Rhs As UInteger) As Boolean
		Return Lhs.Value = Rhs
	End Operator

	Operator =(ByVal Lhs As UInteger, ByRef Rhs As TUInteger) As Boolean
		Return Lhs = Rhs.Value
	End Operator

