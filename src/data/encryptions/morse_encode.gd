@tool
class_name MorseEncode extends Encryption

const MORSE_DATA = {
	"A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.", 
	"G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..", 
	"M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.", 
	"S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-", 
	"Y": "-.--", "Z": "--..", "1": ".----", "2": "..---", "3": "...--", 
	"4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..", 
	"9": "----.", "0": "-----", " ": "/", "|": "|", ".": ".-.-.-",
	"'": ".----."
}

const REVERSE_MORSE = {
	".-": "A", "-...": "B", "-.-.": "C", "-..": "D", ".": "E", "..-.": "F", 
	"--.": "G", "....": "H", "..": "I", ".---": "J", "-.-": "K", ".-..": "L", 
	"--": "M", "-.": "N", "---": "O", ".--.": "P", "--.-": "Q", ".-.": "R", 
	"...": "S", "-": "T", "..-": "U", "...-": "V", ".--": "W", "-..-": "X", 
	"-.--": "Y", "--..": "Z", ".----": "1", "..---": "2", "...--": "3", 
	"....-": "4", ".....": "5", "-....": "6", "--...": "7", "---..": "8", 
	"----.": "9", "-----": "0", "/": " ", "|": "|", ".-.-.-": ".",
	".----.": "'"
}

func encode(input: String) -> String:
	var result = []
	input = input.to_upper()
	
	for char in input:
		var morse = char_to_morse(char)
		if morse:
			result.append(morse)
		else:
			printerr("Invalid character found during morse translation. Letter %s not found" % char)
			
	return " ".join(result)
	
func decode(input: String) -> String:
	var result = ""
	var words = input.split(" / ") # Split by word separator
	
	var decoded_words = []
	for word in words:
		var letters = word.split(" ")
		var decoded_word = ""
		for letter in letters:
			if letter == "": continue
			if REVERSE_MORSE.has(letter):
				decoded_word += REVERSE_MORSE[letter]
			else:
				printerr("Invalid morse sequence: %s" % letter)
		decoded_words.append(decoded_word)
		
	return " ".join(decoded_words)
	
func char_to_morse(char: String) -> String:
	return MORSE_DATA.get(char, "")
