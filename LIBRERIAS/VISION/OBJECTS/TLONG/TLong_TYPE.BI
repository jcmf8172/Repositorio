''' @file TLong_TYPE.BI
''' @brief Segmento TYPE de TLong (declaracion del tipo y sus miembros)

	Type TLong Extends TValue
		Protected:
			FValue As Long
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Long)
			Declare Destructor()
			Declare Property Value() As Long
			Declare Operator Let(ByVal NewValue As Long)
			Declare Property MinValue() As Long
			Declare Property MaxValue() As Long
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Long
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
