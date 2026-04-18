class_name SignalPanel extends PanelContainer

signal replay
signal dot_played
signal dash_played
signal boop_played
signal space_played
signal end_of_word_played

const SPEAKER = preload("uid://copa0m4oo0g2p")
const SPEAKER_SOUND = preload("uid://cmtgw5gp41fat")
const SPEAKER_SOUND_2 = preload("uid://oodi5gkxskfm")

const BOOP = preload("uid://bm86nr26mc1uk")
const DASH = preload("uid://htguj7msnu46")
const DOT = preload("uid://c7chjfm0scum5")

@onready var image: TextureRect = $HFlowContainer/Image
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func play_message(message: Array[EncryptedMessage.MorseSignal]):
	for s in message:
		match s:
			EncryptedMessage.MorseSignal.Dot: await self.dot()
			EncryptedMessage.MorseSignal.Dash: await self.dash()
			EncryptedMessage.MorseSignal.Boop: await self.boop()
			EncryptedMessage.MorseSignal.Space: await self.space()
			EncryptedMessage.MorseSignal.EndOfWord: await self.end_of_word()

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
	
func end_of_word():
	await get_tree().create_timer(0.4).timeout
