''' @file TUShort_TYPE.BI
''' @brief Segmento TYPE de TUShort (declaracion del tipo y sus miembros)

	Type TUShort Extends TValue
		Protected:
			FValue As UShort
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As UShort)
			Declare Destructor()
			Declare Property Value() As UShort
			Declare Operator Let(ByVal NewValue As UShort)
			Declare Property MinValue() As UShort
			Declare Property MaxValue() As UShort
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As UShort
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
