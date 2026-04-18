extends PanelContainer

var pages: Array[Control] = []
var current_page: int = 0

func _ready() -> void:
	for child in get_children():
		if child is Control:
			pages.append(child)
	
	_update_page_visibility()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_rulebook"):
		self.visible = !self.visible
	
	if self.visible:
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
