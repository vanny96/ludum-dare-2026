class_name RuleBook extends Book

@export var pages_parent: Control
@export var change_log: Array[Control]

@export var left_page_button: BaseButton
@export var right_page_button: BaseButton

var pages: Array[Control] = []
var current_page: int = 0

func _ready() -> void:
	super()
	left_page_button.pressed.connect(_change_page.bind(-1))
	right_page_button.pressed.connect(_change_page.bind(1))
	
	for child in pages_parent.get_children():
		if child is Control:
			pages.append(child)
			
	for control in change_log:
		control.hide()
	
	_update_page_visibility()


func reveal_changelog(day: int):
	if day < change_log.size():
		change_log[day].show()

func get_toggle_action_name() -> String:
	return "toggle_rulebook"

func _change_page(direction: int) -> void:
	if pages.size() == 0: return
	
	current_page = (current_page + direction + pages.size()) % pages.size()
	_update_page_visibility()

func _update_page_visibility() -> void:
	for i in range(pages.size()):
		pages[i].visible = (i == current_page)
