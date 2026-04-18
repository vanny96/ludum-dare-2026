class_name MorseEncode extends Encryption

const MORSE_DATA = {
	"A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.", 
	"G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..", 
	"M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.", 
	"S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-", 
	"Y": "-.--", "Z": "--..", "1": ".----", "2": "..---", "3": "...--", 
	"4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..", 
	"9": "----.", "0": "-----", " ": "/"
}

func encrypt(input: String) -> String:
	var result = []
	input = input.to_upper()
	
	for char in input:
		if MORSE_DATA.has(char):
			result.append(MORSE_DATA[char])
			
	return " ".join(result)
