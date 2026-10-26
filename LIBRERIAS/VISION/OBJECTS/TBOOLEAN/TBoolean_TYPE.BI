''' @file TBoolean_TYPE.BI
''' @brief Segmento TYPE de TBoolean (declaracion del tipo y sus miembros)

	Type TBoolean Extends TValue
		Protected:
			FValue As Boolean
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Boolean)
			Declare Constructor(ByRef Source As Const TBoolean)
			Declare Destructor()
			Declare Property Value() As Boolean
			Declare Operator Let(ByVal NewValue As Boolean)
			Declare Property Inverted(ByVal DoInvert As Boolean) As Boolean
			Declare Property AsInteger() As Integer
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Boolean
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
