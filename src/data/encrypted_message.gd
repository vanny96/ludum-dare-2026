class_name EncryptedMessage extends Resource

@export var plain_text: String
@export var encryptions: Array[Encryption]

func get_encrypted_message_string() -> String:
	return ""
	
func get_encypted_message() -> Array[MorseSignals]:
	return []
	
enum MorseSignals {
	Dash, Dot, Boop
}
