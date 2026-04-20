class_name Game extends Node2D

@onready var cameras: Array[Camera2D] = [
	$Camera1, $Camera2, $Camera3
]

@onready var computer: Computer = $Computer
@onready var submit_buttons: SubmitButtons = $SubmitButtons
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
	submit_buttons.set_disabled(true)
	await computer.play_message("INCOMING MESSAGE FROM %s...\n\n" % message.sender)
	await computer.play_message(message.get_encrypted_message())
	submit_buttons.set_disabled(false)
	
	var enemy = await self.submit_buttons.submit_answer
	submit_buttons.set_disabled(true)
	var result_template := "\n\nSUBMISSION IS... %s"
	if message.allow_any:
		await computer.play_message(result_template % "???")
	elif message.enemy == enemy:
		correct_guesses += 1
		await computer.play_message(result_template % "CORRECT")
	else:
		wrong_guesses += 1
		await computer.play_message(result_template % "WRONG")
	await get_tree().create_timer(2).timeout
	computer.reset()
