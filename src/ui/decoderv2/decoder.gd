extends PanelContainer

@export var input_box: TextEdit
@export var output_box: TextEdit

@export var tabs_container: TabContainer
@export var caesar_input_label: RichTextLabel
@export var caesar_decrease_button: Button
@export var caesar_increase_button: Button
@export var vigenere_key: LineEdit

@onready var caesar_decoder := CeasarEncode.new()
@onready var vigenere_decoder := VigenereEncode.new()
@onready var atbash_decoder := AtbashEncode.new()

@onready var active_decoder: Encryption = caesar_decoder

func _ready() -> void:
	tabs_container.tab_changed.connect(_update_decoder)
	input_box.text_changed.connect(_update_translatation)
	
	caesar_decrease_button.pressed.connect(_update_caesar.bind(-1))
	caesar_increase_button.pressed.connect(_update_caesar.bind(1))
	vigenere_key.text_changed.connect(_update_vigenere)

func _update_decoder(idx: int):
	match idx:
		0: active_decoder = caesar_decoder
		1: active_decoder = atbash_decoder
		2: active_decoder = vigenere_decoder
	_update_translatation()

func _update_translatation():
	output_box.text = active_decoder.encode(input_box.text)
	
func _update_caesar(mod: int):
	caesar_decoder.shifts_amount += mod
	caesar_input_label.text = str(caesar_decoder.shifts_amount)
	_update_translatation()
	
func _update_vigenere(new_key: String):
	vigenere_decoder.keyword = new_key
	_update_translatation()
