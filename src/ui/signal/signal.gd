class_name SignalPanel extends PanelContainer

signal stopped
signal replay
signal signal_played(symbol: String)

const SPEAKER = preload("uid://copa0m4oo0g2p")
const SPEAKER_SOUND = preload("uid://cmtgw5gp41fat")
const SPEAKER_SOUND_2 = preload("uid://oodi5gkxskfm")

const BOOP = preload("uid://bm86nr26mc1uk")
const DASH = preload("uid://htguj7msnu46")
const DOT = preload("uid://c7chjfm0scum5")

@export var small_pause_break: float = 0.1
@export var big_pause_break: float = 0.3

@onready var image: TextureRect = $HFlowContainer/Image
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var morse_encrypt := MorseEncode.new()

var playing := false
var stopping := false

func play_message(message: String):
	for word in message.split(" / "):
		for letter in word.split(" "):
			for s in letter:
				match s:
					".": await play_audio(DOT, SPEAKER_SOUND, 0.02)
					"-": await play_audio(DASH, SPEAKER_SOUND_2, 0.05)
					"|": await play_audio(DOT, SPEAKER_SOUND, 0.05)
			var letter_decryped := morse_encrypt.decode(letter)
			signal_played.emit(letter_decryped)
		await get_tree().create_timer(big_pause_break).timeout
		signal_played.emit(" ")
	
func play_audio(stream: AudioStream, sprite: Texture2D, duration: float):
	audio_stream_player.stream = stream
	audio_stream_player.play()
	self.image.texture = sprite
	await get_tree().create_timer(duration).timeout
	audio_stream_player.stop()
	await get_tree().create_timer(small_pause_break).timeout
	self.image.texture = SPEAKER
