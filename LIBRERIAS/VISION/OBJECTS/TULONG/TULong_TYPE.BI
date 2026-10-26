''' @file TULong_TYPE.BI
''' @brief Segmento TYPE de TULong (declaracion del tipo y sus miembros)

	Type TULong Extends TValue
		Protected:
			FValue As ULong
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As ULong)
			Declare Destructor()
			Declare Property Value() As ULong
			Declare Operator Let(ByVal NewValue As ULong)
			Declare Property MinValue() As ULong
			Declare Property MaxValue() As ULong
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As ULong
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
