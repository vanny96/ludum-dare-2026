extends Control

@export_subgroup("Internal")
@export var decoder_rows_parent: Control

@export var caesar_button: Button
@export var caesar_input_node: Control
@export var caesar_input_label: RichTextLabel
@export var caesar_decrease_button: Button
@export var caesar_increase_button: Button

@export var atbash_button: Button

@onready var caesar_decoder := CeasarEncode.new()
@onready var atbash_decoder := AtbashEncode.new()

var decoder_rows: Array[DecoderRow] = []
var active_decoder := ActiveDecoder.Caesar :
	set(decoder):
		active_decoder = decoder
		_on_decoder_switched()
		_update_translatation()

func _ready() -> void:
	for decoder_row: DecoderRow in decoder_rows_parent.get_children():
		decoder_rows.append(decoder_row)
	
	caesar_button.pressed.connect(func(): active_decoder = ActiveDecoder.Caesar)
	atbash_button.pressed.connect(func(): active_decoder = ActiveDecoder.Atbash)
	caesar_decrease_button.pressed.connect(_update_caesar.bind(-1))
	caesar_increase_button.pressed.connect(_update_caesar.bind(1))
	
	_update_translatation()
	
func _on_decoder_switched():
	match active_decoder:
		ActiveDecoder.Caesar:
			caesar_input_node.show()
		ActiveDecoder.Atbash:
			caesar_input_node.hide()

func _update_translatation():
	var decoder: Encryption
	match active_decoder:
		ActiveDecoder.Caesar: decoder = caesar_decoder
		ActiveDecoder.Atbash: decoder = atbash_decoder
	
	for decoder_row: DecoderRow in decoder_rows:
		var encoded: String = decoder.encode(decoder_row.letter_from.text)
		decoder_row.letter_to.text = encoded
		
func _update_caesar(mod: int):
	caesar_decoder.shifts_amount += mod
	caesar_input_label.text = str(caesar_decoder.shifts_amount)
	_update_translatation()

enum ActiveDecoder {
	Caesar, Atbash
}
