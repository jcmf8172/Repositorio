''' @file TObject_TYPE.BI
''' @brief Segmento TYPE de TObject (declaracion del tipo y sus miembros)

	Type TObject Extends Object
		Public:
			Declare Constructor()
			Declare Destructor()
			Declare Virtual Property Name() As String
			Declare Property Id() As String
			Declare Virtual Property ToString() As String
			Declare Virtual Function Clone() As TObject Ptr
	End Type
