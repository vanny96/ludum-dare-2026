class_name EncryptedMessage extends Resource

@export var plain_text: String = ""
@export var encryptions: Array[Encryption] = []
@export var enemy: bool = false

func get_encrypted_message_string() -> String:
	var encrypted_text = plain_text
	for encryption in encryptions:
		encrypted_text = encryption.encode(encrypted_text)
	return encrypted_text
	
func get_encrypted_message() -> Array[MorseSignal]:
	var encrypted_text = get_encrypted_message_string()
	var signals: Array[MorseSignal] = []
	for letter in encrypted_text.split(""):
		match letter:
			".": signals.append(MorseSignal.Dot)
			"-": signals.append(MorseSignal.Dash)
			"|": signals.append(MorseSignal.Boop)
			"/": signals.append(MorseSignal.EndOfWord)
			" ": signals.append(MorseSignal.Space)
			_: 
				printerr("Invalid encrypted message. Unexpected character %s" % letter)
				return []
	return signals
	
enum MorseSignal {
	Dash, Dot, Boop, EndOfWord, Space
}
