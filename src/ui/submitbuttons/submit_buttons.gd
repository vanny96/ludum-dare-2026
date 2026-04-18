class_name SubmitButtons extends Control

signal submit_answer(enemy: bool)

@onready var ally_button: Button = $Container/Ally
@onready var enemy_button: Button = $Container/Enemy

func _ready() -> void:
	ally_button.pressed.connect(submit_answer.emit.bind(false))
	enemy_button.pressed.connect(submit_answer.emit.bind(true))
