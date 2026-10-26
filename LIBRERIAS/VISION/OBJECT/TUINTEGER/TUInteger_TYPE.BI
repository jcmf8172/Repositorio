''' @file TUInteger_TYPE.BI
''' @brief Segmento TYPE de TUInteger (declaracion del tipo y sus miembros)

	Type TUInteger Extends TValue
		Protected:
			FValue As ULong
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As UInteger)
			Declare Destructor()
			Declare Property Value() As UInteger
			Declare Operator Let(ByVal NewValue As UInteger)
			Declare Property MinValue() As UInteger
			Declare Property MaxValue() As UInteger
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As UInteger
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
