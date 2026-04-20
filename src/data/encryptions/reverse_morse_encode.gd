@tool
class_name ReverseMorseEncode extends MorseEncode

func char_to_morse(char: String) -> String:
	var normal = super(char)
	var result = []
	for letter in normal.split(""):
		match letter:
			".": result.append("-")
			"-": result.append(".")
			_: result.append(letter)
	return "".join(result)
