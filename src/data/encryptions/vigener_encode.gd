class_name VigenereEncode extends Encryption

@export var keyword: String = ""

func encode(input: String) -> String:
	if keyword.is_empty():
		return input
		
	var result = ""
	var keyword_upper = keyword.to_upper()
	var key_index = 0
	
	for i in range(input.length()):
		var char_code = input.unicode_at(i)
		
		if char_code >= 65 and char_code <= 90: # Uppercase A-Z
			var shift = keyword_upper.unicode_at(key_index % keyword_upper.length()) - 65
			result += char(65 + (char_code - 65 + shift) % 26)
			key_index += 1
		elif char_code >= 97 and char_code <= 122: # Lowercase a-z
			var shift = keyword_upper.unicode_at(key_index % keyword_upper.length()) - 65
			result += char(97 + (char_code - 97 + shift) % 26)
			key_index += 1
		else:
			result += input[i]
			
	return result
