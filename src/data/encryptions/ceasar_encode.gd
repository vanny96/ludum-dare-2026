class_name CeasarEncode extends Encryption

@export var shifts_amount: int = 0

func encrypt(input: String) -> String:
	var result = ""
	
	for i in range(input.length()):
		var ascii = input.unicode_at(i)
		
		if ascii >= 65 and ascii <= 90:
			result += char(posmod(ascii - 65 + shifts_amount, 26) + 65)
		elif ascii >= 97 and ascii <= 122:
			result += char(posmod(ascii - 97 + shifts_amount, 26) + 97)
		else:
			result += input[i]
			
	return result
