''' @file TLongInt_TYPE.BI
''' @brief Segmento TYPE de TLongInt (declaracion del tipo y sus miembros)

	Type TLongInt Extends TValue
		Protected:
			FValue As LongInt
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As LongInt)
			Declare Destructor()
			Declare Property Value() As LongInt
			Declare Operator Let(ByVal NewValue As LongInt)
			Declare Property MinValue() As LongInt
			Declare Property MaxValue() As LongInt
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As LongInt
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
