class_name SignalPanel extends PanelContainer

signal replay

const BOOP = preload("uid://bm86nr26mc1uk")
const DASH = preload("uid://htguj7msnu46")
const DOT = preload("uid://c7chjfm0scum5")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func play_message(message: Array[EncryptedMessage.MorseSignal]):
	for s in message:
		print(s)

func dot():
	audio_stream_player.stream = DOT
	audio_stream_player.play()
	await audio_stream_player.finished
func dash():
	audio_stream_player.stream = DASH
	audio_stream_player.play()
	await audio_stream_player.finished
func boop():
	audio_stream_player.stream = BOOP
	audio_stream_player.play()
	await audio_stream_player.finished
func space():
	await get_tree().create_timer(0.2).timeout
