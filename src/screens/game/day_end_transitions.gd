class_name DayTransition extends CanvasLayer

@export var typing_speed: float = 0.1

@export_subgroup("Internal")
@export var text: RichTextLabel
@export var panel: ColorRect

# Use only for first day
func play_start_day(day: int):
	panel.color.a = 1
	text.text = ""
	panel.visible = true
	await type_message("DAY %s: START" % day)
	await get_tree().create_timer(1.5).timeout
	await create_tween().tween_property(panel, "modulate:a", 0, 1).finished
	panel.visible = false
	
func play_day_transition(from_day: int, to_day: int):
	panel.color.a = 0
	text.text = ""
	panel.visible = true
	await create_tween().tween_property(panel, "modulate:a", 1, 1).finished
	await type_message("DAY %s: END" % from_day)
	await get_tree().create_timer(1.5).timeout
	await erase_message()
	await type_message("DAY %s: START" % to_day)
	await get_tree().create_timer(1.5).timeout
	await create_tween().tween_property(panel, "modulate:a", 0, 1).finished
	panel.visible = false
	
func play_end_game():
	panel.color.a = 0
	text.text = ""
	panel.visible = true
	await create_tween().tween_property(panel, "modulate:a", 1, 1).finished
	await type_message("OPERATION COMPLETED.")
	await get_tree().create_timer(1.5).timeout
	await erase_message()
	await type_message("THANKS FOR PLAYING.")
	
func type_message(message: String):
	text.text = message
	text.visible_characters = 0
	
	for i in message.length():
		await get_tree().create_timer(typing_speed).timeout
		text.visible_characters += 1
		
func erase_message():
	var visible_chars = text.visible_characters
	for i in visible_chars:
		await get_tree().create_timer(typing_speed).timeout
		text.visible_characters -= 1
