class_name SignalPanel extends PanelContainer

signal replay

@onready var replay_btn: Button = $HFlowContainer/Replay

const SPEAKER = preload("uid://copa0m4oo0g2p")
const SPEAKER_SOUND = preload("uid://cmtgw5gp41fat")
const SPEAKER_SOUND_2 = preload("uid://oodi5gkxskfm")
@onready var image: TextureRect = $HFlowContainer/Image

const BOOP = preload("uid://bm86nr26mc1uk")
const DASH = preload("uid://htguj7msnu46")
const DOT = preload("uid://c7chjfm0scum5")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func play_message(message: Array[EncryptedMessage.MorseSignal]):
	for s in message:
		if s == EncryptedMessage.MorseSignal.Dot:
			await self.dot()
		if s == EncryptedMessage.MorseSignal.Dash:
			await self.dash()
		if s == EncryptedMessage.MorseSignal.Boop:
			await self.boop()
		if s == EncryptedMessage.MorseSignal.EndOfWord:
			await self.space()

func _ready():
	replay_btn.pressed.connect(func(): self.replay.emit())

func dot():
	audio_stream_player.stream = DOT
	audio_stream_player.play()
	self.image.texture = SPEAKER_SOUND
	await audio_stream_player.finished
	self.image.texture = SPEAKER
func dash():
	audio_stream_player.stream = DASH
	audio_stream_player.play()
	self.image.texture = SPEAKER_SOUND_2
	await audio_stream_player.finished
	self.image.texture = SPEAKER
func boop():
	audio_stream_player.stream = BOOP
	audio_stream_player.play()
	self.image.texture = SPEAKER_SOUND
	await audio_stream_player.finished
	self.image.texture = SPEAKER
func space():
	await get_tree().create_timer(0.2).timeout
