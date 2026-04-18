class_name SubmitButtons extends HBoxContainer

signal submit_answer(enemy: bool)

@onready var ally_button: Button = $Ally
@onready var enemy_button: Button = $Enemy

func _ready() -> void:
	ally_button.pressed.emit(submit_answer.emit.bind(false))
	enemy_button.pressed.emit(submit_answer.emit.bind(true))
