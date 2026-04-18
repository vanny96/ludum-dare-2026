extends PanelContainer

var pages: Array[Control] = []
var current_page: int = 0

var dragging: bool = false
var drag_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	for child in get_children():
		if child is Control:
			pages.append(child)
	
	_update_page_visibility()

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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_rulebook"):
		self.visible = !self.visible
		if self.visible:
			grab_focus()
	
	if self.visible and self.has_focus():
		if event.is_action_pressed("move_right"):
			_change_page(1)
		elif event.is_action_pressed("move_left"):
			_change_page(-1)

func _change_page(direction: int) -> void:
	if pages.size() == 0: return
	
	current_page = (current_page + direction + pages.size()) % pages.size()
	_update_page_visibility()

func _update_page_visibility() -> void:
	for i in range(pages.size()):
		pages[i].visible = (i == current_page)
