class_name SubmitButtons extends Control

signal submit_answer(enemy: bool)

@export var disabled: bool = true

@onready var ally_button: BaseButton = $Container/Ally
@onready var enemy_button: BaseButton = $Container/Enemy

func _ready() -> void:
	ally_button.pressed.connect(submit_answer.emit.bind(false))
	enemy_button.pressed.connect(submit_answer.emit.bind(true))
	set_disabled(disabled)

func set_disabled(disabled: bool):
	ally_button.disabled = disabled
	enemy_button.disabled = disabled
