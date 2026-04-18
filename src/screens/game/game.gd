extends Node2D

@onready var buttons: MorseButtons = $UI/Buttons
@onready var computer: Computer = $UI/Computer

func _ready() -> void:
	self.buttons.dot.connect(func(): computer.add_char("."))
	self.buttons.boop.connect(func(): computer.add_char("|"))
	self.buttons.dash.connect(func(): computer.add_char("-"))
	self.buttons.space.connect(func(): computer.add_char(" "))
	

func _process(delta: float) -> void:
	pass
