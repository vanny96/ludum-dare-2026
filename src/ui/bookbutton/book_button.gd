@tool
extends Control

@export var book: Control
@export var texture: Texture2D:
	set(p_texture):
		texture = p_texture
		if texture:
			texture_rect.texture = texture

@export_subgroup("Internal")
@export var button: BaseButton
@export var texture_rect: TextureRect

func _ready() -> void:
	button.pressed.connect(toggle_book)
	
func toggle_book():
	book.visible = not book.visible
