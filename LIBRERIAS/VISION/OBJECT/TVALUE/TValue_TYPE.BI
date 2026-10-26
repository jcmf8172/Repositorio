''' @file TValue_TYPE.BI
''' @brief Segmento TYPE de TValue (declaracion del tipo y sus miembros)

	Type TValue Extends TObject
		Protected:
			Declare Virtual Function GetValueText() As String
			Declare Virtual Function IsDefaultValue() As Boolean

		Public:
			Declare Constructor()
			Declare Destructor()
			Declare Virtual Property Kind() As String
			Declare Virtual Property IsDefault() As Boolean
			Declare Virtual Property IsEmpty() As Boolean
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Virtual Property ToString() As String Override
	End Type
