''' @file TDouble_TYPE.BI
''' @brief Segmento TYPE de TDouble (declaracion del tipo y sus miembros)

	Type TDouble Extends TValue
		Protected:
			FValue As Double
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Double)
			Declare Destructor()
			Declare Property Value() As Double
			Declare Operator Let(ByVal NewValue As Double)
			Declare Property MinValue() As Double
			Declare Property MaxValue() As Double
			Declare Property IsNan() As Boolean
			Declare Property IsInf() As Boolean
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Double
			Declare Function NativeValue() As Double Option("SSE")
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
