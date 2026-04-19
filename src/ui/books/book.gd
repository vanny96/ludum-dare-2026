@abstract
class_name Book extends Control

@export var close_button: BaseButton

var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	if close_button:
		close_button.pressed.connect(close)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = get_global_mouse_position() - global_position
			else:
				dragging = false

	if event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() - drag_offset

func _input(event: InputEvent) -> void:
	var toggle_action := get_toggle_action_name()
	if toggle_action and event.is_action_pressed(toggle_action):
		self.visible = !self.visible
		if self.visible:
			grab_focus()
			
	if event is InputEventMouseButton and event.pressed and self.visible:
		var click_pos = get_global_mouse_position()
		if not get_global_rect().has_point(click_pos):
			release_all_focus(self)
			
@abstract
func get_toggle_action_name() -> String

func close():
	release_all_focus(self)
	visible = false

func release_all_focus(parent_node: Control):
	if parent_node.has_focus():
		parent_node.release_focus()
	
	for child in parent_node.get_children():
		if child is Control:
			release_all_focus(child)
