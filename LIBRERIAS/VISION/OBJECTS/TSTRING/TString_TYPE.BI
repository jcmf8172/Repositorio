''' @file TString_TYPE.BI
''' @brief Segmento TYPE de TString (declaracion del tipo y sus miembros)

	Type TString Extends TValue
		Protected:
			FValue As String
			Declare Function GetValueText() As String Override
			Declare Function IsDefaultValue() As Boolean Override

		Public:
			Declare Constructor()
			Declare Constructor(ByVal NewValue As String)
			Declare Constructor(ByRef Source As Const TString)
			Declare Destructor()
			Declare Property Value() As String
			Declare Operator Let(ByVal NewValue As String)
			Declare Property Length() As Integer
			Declare Property Upper() As String
			Declare Property Lower() As String
			Declare Property Trimmed(ByVal DoTrim As Boolean) As String
			Declare Virtual Property Kind() As String Override
			Declare Virtual Property Name() As String Override
			Declare Virtual Property IsEmpty() As Boolean Override
			Declare Sub Reset(ByVal DoReset As Boolean)
			Declare Operator Cast() As String
			Declare Virtual Function Clone() As TObject Ptr Override
	End Type
