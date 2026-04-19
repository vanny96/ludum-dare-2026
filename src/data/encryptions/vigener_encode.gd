class_name VigenereEncode extends Encryption

@export var keyword: String = ""

func encode(input: String) -> String:
	return _process(input, 1)

func decode(input: String) -> String:
	return _process(input, -1)

func _process(input: String, direction: int) -> String:
	if keyword.is_empty():
		return input
		
	var result = ""
	var keyword_upper = keyword.to_upper()
	var key_index = 0
	var key_len = keyword_upper.length()
	
	for i in range(input.length()):
		var char_code = input.unicode_at(i)
		var is_upper = char_code >= 65 and char_code <= 90
		var is_lower = char_code >= 97 and char_code <= 122
		
		if is_upper or is_lower:
			var base = 65 if is_upper else 97
			var shift = (keyword_upper.unicode_at(key_index % key_len) - 65) * direction
			# Add 26 before modulo to handle negative results during decoding
			result += char(base + (char_code - base + shift + 26) % 26)
			key_index += 1
		else:
			result += input[i]
			
	return result
