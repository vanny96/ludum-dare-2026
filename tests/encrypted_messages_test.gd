@tool
extends Node

@export_tool_button("Run Tests") var run = func(): run_tests()

func run_tests():
	test_standard_sentence()
	test_alphanumeric_mix()
	test_sentence_with_boop()
	test_caesar_then_morse()
	test_reverse_morse_hello_world()
	test_standard_sentence_array()
	test_vigenere_standard()
	print("All tests completed.")
	
func test_standard_sentence():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "Hello World"
	base_test.encryptions.append(MorseEncode.new())
	
	var result = base_test.get_encrypted_message_string()
	var expected = ".... . .-.. .-.. --- / .-- --- .-. .-.. -.."
	
	assert(result == expected, "Standard sentence failed. Result: " + result)
	print("test_standard_sentence: Passed")

func test_alphanumeric_mix():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "SOS 123"
	base_test.encryptions.append(MorseEncode.new())
	
	var result = base_test.get_encrypted_message_string()
	var expected = "... --- ... / .---- ..--- ...--"
	
	assert(result == expected, "Alphanumeric mix failed. Result: " + result)
	print("test_alphanumeric_mix: Passed")
	
func test_sentence_with_boop():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "ALPHA | test"
	base_test.encryptions.append(MorseEncode.new())
	
	var result = base_test.get_encrypted_message_string()
	var expected = ".- .-.. .--. .... .- / | / - . ... -"
	
	assert(result == expected, "Boop test failed. Result: %s Expected: %s" % [result, expected])
	print("test_sentence_with_boop: Passed")
	
func test_caesar_then_morse():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "ABC"
	
	var caesar = CeasarEncode.new()
	caesar.shifts_amount = 1
	
	base_test.encryptions.append(caesar)
	base_test.encryptions.append(MorseEncode.new())
	
	var result = base_test.get_encrypted_message_string()
	# B: -... C: -.-. D: -..
	var expected = "-... -.-. -.."
	
	assert(result == expected, "Caesar + Morse failed. Result: " + result)
	print("test_caesar_then_morse: Passed")
	
func test_reverse_morse_hello_world():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "Hello World"
	base_test.encryptions.append(ReverseMorseEncode.new())
	
	var result = base_test.get_encrypted_message_string()
	var expected = "---- - -.-- -.-- ... / -.. ... -.- -.-- .--"
	
	assert(result == expected, "ReverseMorseEncode failed. Result: " + result)
	print("test_reverse_morse_hello_world: Passed")
	
func test_standard_sentence_array():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "Hello World"
	base_test.encryptions.append(MorseEncode.new())
	
	var result = base_test.get_encrypted_message()
	var expected = [
	# H-e-l-l-o
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Space, 
	
	# Word Boundary
	EncryptedMessage.MorseSignal.EndOfWord, EncryptedMessage.MorseSignal.Space, 
	
	# W-o-r-l-d
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Space, 
	EncryptedMessage.MorseSignal.Dash, EncryptedMessage.MorseSignal.Dot, EncryptedMessage.MorseSignal.Dot
	]
	
	assert(result == expected, "Standard sentence failed. Result: please debug manually")
	print("test_standard_sentence: Passed")
	
func test_vigenere_standard():
	var base_test = EncryptedMessage.new()
	base_test.plain_text = "Attack at Dawn"
	
	var vigenere = VigenereEncode.new()
	vigenere.keyword = "LEMON"
	
	base_test.encryptions.append(vigenere)
	
	var result = base_test.get_encrypted_message_string()
	var expected = "Lxfopv ef Rnhr"
	
	assert(result == expected, "Vigenere standard test failed. Result: " + result)
	print("test_vigenere_standard: Passed")
