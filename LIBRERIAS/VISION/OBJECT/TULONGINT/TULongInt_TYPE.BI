''' @file TULongInt_TYPE.BI
''' @brief Segmento TYPE de TULongInt (declaracion del tipo y sus miembros)

	Type TULongInt Extends TValue
		Protected:
			FValue As ULongInt
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As ULongInt)
			Declare Destructor()
			Declare Property Value() As ULongInt
			Declare Operator Let(ByVal NewValue As ULongInt)
			Declare Property MinValue() As ULongInt
			Declare Property MaxValue() As ULongInt
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As ULongInt
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
