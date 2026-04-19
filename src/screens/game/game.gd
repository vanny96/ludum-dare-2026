class_name Game extends Node2D

@onready var cameras: Array[Camera2D] = [
	$Camera1, $Camera2, $Camera3
]

@onready var signal_emitter: SignalPanel = %Signal
@onready var computer: Computer = $Computer
@onready var buttons: MorseButtons = $UI/Buttons
@onready var submit_buttons: SubmitButtons = $UI/SubmitButtons
@onready var left: BaseButton = $UI/Left
@onready var right: BaseButton = $UI/Right

@export var rulebook: RuleBook
@export var day_transition: DayTransition
@export var daily_messages: Array[DailyMessages]

var current_camera_idx: int = 0

var current_day_idx: int = 0

var correct_guesses: int = 0
var wrong_guesses: int = 0

func set_to_camera(i: int):
	self.cameras[current_camera_idx % self.cameras.size()].enabled = false
	self.cameras[i % self.cameras.size()].enabled = true
	self.current_camera_idx = i
	
func _ready() -> void:
	self.left.pressed.connect(func(): self.set_to_camera(self.current_camera_idx - 1))
	self.right.pressed.connect(func(): self.set_to_camera(self.current_camera_idx + 1))
	self.signal_emitter.signal_played.connect(computer.add_char)
	
	await day_transition.play_start_day(1)
	
	var total_days = daily_messages.size()
	for i in range(total_days):
		rulebook.reveal_changelog(i)
		await play_day(daily_messages[i])
		if i < total_days - 1:
			await day_transition.play_day_transition(i + 1, i + 2)
	await day_transition.play_end_game()

func play_day(day: DailyMessages):
	for message: EncryptedMessage in day.messages:
		await play_message(message)

func play_message(message: EncryptedMessage):
	submit_buttons.hide()
	await computer.add_sender(message.sender)
	await signal_emitter.play_message(message.get_encrypted_message())
	submit_buttons.show()
	
	var enemy = await self.submit_buttons.submit_answer
	if message.enemy == enemy:
		correct_guesses += 1
	else:
		wrong_guesses += 1
	computer.reset()
