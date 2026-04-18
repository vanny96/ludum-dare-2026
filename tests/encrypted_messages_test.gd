@tool
extends Node

@export_tool_button("Run Tests") var run = func(): run_tests()

func run_tests():
	test_standard_sentence()
	test_alphanumeric_mix()
	test_caesar_then_morse()
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
