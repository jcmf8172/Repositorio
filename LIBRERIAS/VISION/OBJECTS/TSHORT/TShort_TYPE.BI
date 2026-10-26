''' @file TShort_TYPE.BI
''' @brief Segmento TYPE de TShort (declaracion del tipo y sus miembros)

	Type TShort Extends TValue
		Protected:
			FValue As Short
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Short)
			Declare Destructor()
			Declare Property Value() As Short
			Declare Operator Let(ByVal NewValue As Short)
			Declare Property MinValue() As Short
			Declare Property MaxValue() As Short
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Short
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
