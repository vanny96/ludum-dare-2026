@tool
class_name EncryptedMessage extends Resource

@export var sender: String = ""
@export_multiline() var plain_text: String = "":
	set(p_text):
		plain_text = p_text
		notify_property_list_changed()

@export var encryptions: Array[Encryption] = [] :
	set(p_encryptions):
		encryptions = p_encryptions
		notify_property_list_changed()

@export var enemy: bool = false
@export var allow_any: bool = false

func get_encrypted_message() -> String:
	var encrypted_text = plain_text
	for encryption in encryptions:
		encrypted_text = encryption.encode(encrypted_text)
	return encrypted_text


func _get_property_list() -> Array[Dictionary]:
	return [{
		"name": "encrypted_preview",
		"type": TYPE_STRING,
		"usage": PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_READ_ONLY,
		"hint": PROPERTY_HINT_MULTILINE_TEXT
	}]

func _get(property: StringName):
	if property == "encrypted_preview":
		return get_encrypted_message()
	return null
