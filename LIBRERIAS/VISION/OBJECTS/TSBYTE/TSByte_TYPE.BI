''' @file TSByte_TYPE.BI
''' @brief Segmento TYPE de TSByte (declaracion del tipo y sus miembros)

	Type TSByte Extends TValue
		Protected:
			FValue As Byte
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As Byte)
			Declare Destructor()
			Declare Property Value() As Byte
			Declare Property MinValue() As Byte
			Declare Property MaxValue() As Byte
			Declare Operator Let(ByVal NewValue As Byte)
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As Byte
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
