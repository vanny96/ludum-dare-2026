class_name Computer extends Control

@onready var blips: TypiningText = %Blips

func add_sender(sender: String):
	add_char("INCOMING %s MESSAGE...\n" % sender)
	await blips.completed

func add_char(s: String):
	blips.simulate_typing(s)
	
func reset():
	await blips.stop()
	blips._display_text = ""
