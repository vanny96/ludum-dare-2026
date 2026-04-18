class_name MorseButtons extends PanelContainer


signal dot
signal boop
signal dash
signal space

@onready var dot_btn: Button = $MarginContainer/VBoxContainer/Morse/LC/Dot
@onready var boop_btn: Button = $MarginContainer/VBoxContainer/Morse/LC2/Boop
@onready var dash_btn: Button = $MarginContainer/VBoxContainer/Morse/LC3/Dash
@onready var space_btn: Button = $MarginContainer/VBoxContainer/Space/Space

func _init():
	self._register()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dot"):
		self.dot.emit(	)
	if event.is_action_pressed("boop"):
		self.boop.emit()
	if event.is_action_pressed("dash"):
		self.dash.emit()
	if event.is_action_pressed("space"):
		self.space.emit()

func _register():
	self.dot_btn.pressed.connect(func(): self.dot.emit())
	self.boop_btn.pressed.connect(func(): self.boop.emit())
	self.dash_btn.pressed.connect(func(): self.dash.emit())
	self.space_btn.pressed.connect(func(): self.space.emit())
