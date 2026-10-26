''' @file TByte_TYPE.BI
''' @brief Segmento TYPE de TByte (declaracion del tipo y sus miembros)

	Type TByte Extends TValue
		Protected:
			FValue As UByte
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As UByte)
			Declare Destructor()
			Declare Property Value() As UByte
			Declare Operator Let(ByVal NewValue As UByte)
			Declare Property MinValue() As UByte
			Declare Property MaxValue() As UByte
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As UByte
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
