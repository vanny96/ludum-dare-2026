@tool
extends Control

@export var spy: Spy:
	set(p_spy):
		spy = p_spy
		if spy:
			update_ui.call_deferred()
			
@export_subgroup("Internal")
@export var face: TextureRect
@export var name_label: RichTextLabel
@export var notes_button: Button
@export var spy_note_canvas: CanvasLayer
@export var spy_note: SpyNote

func _ready() -> void:
	notes_button.pressed.connect(spy_note.show)
	
func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		spy_note_canvas.visible = spy_note.visible

func update_ui():
	name_label.text = spy.name
	face.texture = spy.picture
	spy_note.update_with_spy(spy)
	
