''' @file TSingle_TYPE.BI
''' @brief Segmento TYPE de TSingle (declaracion del tipo y sus miembros)

	Type TSingle Extends TValue
		Protected:
			FValue As Single
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Single)
			Declare Destructor()
			Declare Property Value() As Single
			Declare Operator Let(ByVal NewValue As Single)
			Declare Property MinValue() As Single
			Declare Property MaxValue() As Single
			Declare Property IsNan() As Boolean
			Declare Property IsInf() As Boolean
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Single
			Declare Function NativeValue() As Single Option("SSE")
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
