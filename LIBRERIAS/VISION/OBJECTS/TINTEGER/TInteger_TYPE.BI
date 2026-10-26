''' @file TInteger_TYPE.BI
''' @brief Segmento TYPE de TInteger (declaracion del tipo y sus miembros)

	Type TInteger Extends TValue
		Protected:
			FValue As Long
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Integer)
			Declare Destructor()
			Declare Property Value() As Integer
			Declare Operator Let(ByVal NewValue As Integer)
			Declare Property MinValue() As Integer
			Declare Property MaxValue() As Integer
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Integer
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
