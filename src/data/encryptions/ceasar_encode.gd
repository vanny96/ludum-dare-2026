class_name CeasarEncode extends Encryption

@export var shifts_amount: int = 0

func encode(input: String) -> String:
	return _internal_encode(input, shifts_amount)

func decode(input: String) -> String:
	return _internal_encode(input, -shifts_amount)

func _internal_encode(input: String, shift: int):
	var result = ""
	
	for i in range(input.length()):
		var ascii = input.unicode_at(i)
		
		if ascii >= 65 and ascii <= 90:
			result += char(posmod(ascii - 65 + shift, 26) + 65)
		elif ascii >= 97 and ascii <= 122:
			result += char(posmod(ascii - 97 + shift, 26) + 97)
		else:
			result += input[i]
			
	return result
