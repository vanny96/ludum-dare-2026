class_name AtbashEncode extends Encryption

func encode(input: String) -> String:
	var result = ""
	
	for i in range(input.length()):
		var ascii = input.unicode_at(i)
		
		if ascii >= 65 and ascii <= 90:
			result += char(155 - ascii)
		elif ascii >= 97 and ascii <= 122:
			result += char(219 - ascii)
		else:
			result += input[i]
			
	return result
