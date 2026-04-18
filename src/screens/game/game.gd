extends Node2D

@onready var cameras: Array[Camera2D] = [
	$Camera1, $Camera2, $Camera3
]
@onready var current_camera_idx: int = 0



@onready var buttons: MorseButtons = $UI/Buttons
@onready var signal_emitter: SignalPanel = %Signal
@onready var computer: Computer = $UI/Computer
@onready var submit_buttons: SubmitButtons = $UI/SubmitButtons
@onready var left: Button = $UI/Left
@onready var right: Button = $UI/Right

@export var daily_messages: Array[DailyMessages]
@onready var current_message := daily_messages[current_day_idx].messages[current_message_idx]
var current_day_idx: int = 0
var current_message_idx: int = 0

var correct_guesses: int = 0
var wrong_guesses: int = 0

func set_to_camera(i: int):
	print(i)
	self.cameras[current_camera_idx % self.cameras.size()].enabled = false
	self.cameras[i % self.cameras.size()].enabled = true
	self.current_camera_idx = i
	
func _ready() -> void:
	#self.buttons.dot.connect(func(): computer.add_char("."))
	#self.buttons.boop.connect(func(): computer.add_char("|"))
	#self.buttons.dash.connect(func(): computer.add_char("-"))
	#self.buttons.space.connect(func(): computer.add_char(" "))
	self.left.pressed.connect(func(): self.set_to_camera(self.current_camera_idx - 1))
	self.right.pressed.connect(func(): self.set_to_camera(self.current_camera_idx + 1))
	
	self.signal_emitter.replay.connect(play_message)
	self.submit_buttons.submit_answer.connect(submit_answer)

func play_message():
	signal_emitter.play_message(current_message.get_encrypted_message())
	
func submit_answer(enemy: bool):
	if current_message.enemy == enemy:
		correct_guesses += 1
		print("Correct")
	else:
		wrong_guesses += 1
		print("Wrong")
	
	current_message_idx += 1
	
	if current_message_idx >= daily_messages[current_day_idx].messages.size():
		current_message_idx = 0
		current_day_idx += 1
	
	if current_day_idx < daily_messages.size():
		current_message = daily_messages[current_day_idx].messages[current_message_idx]
	else:
		print("All messages processed.")
