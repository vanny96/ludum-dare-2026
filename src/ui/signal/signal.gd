class_name SignalPanel extends PanelContainer

const SPEAKER = preload("uid://copa0m4oo0g2p")
const SPEAKER_SOUND = preload("uid://cmtgw5gp41fat")
const SPEAKER_SOUND_2 = preload("uid://oodi5gkxskfm")

const BOOP = preload("uid://bm86nr26mc1uk")
const DASH = preload("uid://htguj7msnu46")
const DOT = preload("uid://c7chjfm0scum5")

@onready var image: TextureRect = $HFlowContainer/Image
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func play_random_signal() -> void:
	var sounds: Array = [BOOP, DASH, DOT]
	var textures: Array = [SPEAKER_SOUND, SPEAKER_SOUND_2]
	
	audio_stream_player.stream = sounds.pick_random()
	audio_stream_player.play()
	
	image.texture = textures.pick_random()
	
func reset():
	image.texture = SPEAKER
	audio_stream_player.stop()
