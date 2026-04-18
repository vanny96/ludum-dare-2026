@tool
class_name DecoderRow extends HBoxContainer

@export var letter: String:
	set(p_letter):
		letter = p_letter
		if(letter_from):
			letter_from.text = letter

@export_subgroup("Internal")
@export var letter_from: RichTextLabel
@export var letter_to: RichTextLabel
