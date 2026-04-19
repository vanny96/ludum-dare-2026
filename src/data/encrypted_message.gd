class_name EncryptedMessage extends Resource

@export var sender: String = ""
@export_multiline() var plain_text: String = ""
@export var encryptions: Array[Encryption] = []
@export var enemy: bool = false

func get_encrypted_message() -> String:
	var encrypted_text = plain_text
	for encryption in encryptions:
		encrypted_text = encryption.encode(encrypted_text)
	return encrypted_text
