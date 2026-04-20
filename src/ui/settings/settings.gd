extends Control

@onready var master_audio_slider: Slider = $PanelContainer/VBoxContainer/GridContainer/MasterAudio/MasterAudio
@onready var sfx_audio_slider: Slider = $PanelContainer/VBoxContainer/GridContainer/SFX/MasterAudio
@onready var music_audio_slider: Slider = $PanelContainer/VBoxContainer/GridContainer/Music/MasterAudio
@onready var sensibility_slider: Slider = $PanelContainer/VBoxContainer/GridContainer/Sensibility/Sensibility
@onready var close_button: Button = $PanelContainer/VBoxContainer/CloseButton

@onready var master_bus_idx: int = AudioServer.get_bus_index("Master")
@onready var sfx_bus_idx: int = AudioServer.get_bus_index("SFX")
@onready var music_bus_idx: int = AudioServer.get_bus_index("Music")

func _ready() -> void:
	_setup_audio_slider(master_audio_slider, master_bus_idx)
	_setup_audio_slider(sfx_audio_slider, sfx_bus_idx)
	_setup_audio_slider(music_audio_slider, music_bus_idx)
	_setup_sensibility()
	_setup_close_button()
	
func _setup_audio_slider(slider: Slider, bus_idx: int):
	slider.value = AudioServer.get_bus_volume_linear(bus_idx) * 100
	slider.value_changed.connect(func(value): 
		AudioServer.set_bus_volume_linear(bus_idx, value / 100)
	)
	
func _setup_sensibility():
	sensibility_slider.value = Globals.sensibility
	master_audio_slider.value_changed.connect(func(value): Globals.sensibility = value)
	
func _setup_close_button():
	close_button.pressed.connect(func():
		visible = false
	)
