class_name Computer extends Control

@export var signal_panel: SignalPanel

@onready var blips: TypiningText = %Blips

func _ready() -> void:
	blips.letter_typed.connect(signal_panel.play_random_signal)

func play_message(message: EncryptedMessage):
	await blips.simulate_typing("INCOMING %s MESSAGE...\n\n%s" % [message.sender, message.get_encrypted_message()])
	signal_panel.reset()
	
func reset():
	blips.clear()
	blips.visible_characters = 0
