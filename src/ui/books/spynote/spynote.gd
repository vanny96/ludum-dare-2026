@tool
class_name SpyNote extends Book

@export var name_value: RichTextLabel
@export var gender_value: RichTextLabel
@export var age_value: RichTextLabel
@export var positive_keywords_parent: Control
@export var negative_keywords_parent: Control

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and self.visible:
		var click_pos = get_global_mouse_position()
		if not get_global_rect().has_point(click_pos):
			release_all_focus(self)
			hide()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and self.visible:
		var click_pos = get_global_mouse_position()
		if not get_global_rect().has_point(click_pos):
			release_all_focus(self)
			hide()
			
func update_with_spy(spy: Spy):
	name_value.text = spy.name
	gender_value.text = spy.gender
	age_value.text = str(spy.age)
	
	_update_keywords(positive_keywords_parent, spy.good_keywords, true)
	_update_keywords(negative_keywords_parent, spy.bad_keywords, false)
		
func _update_keywords(keyword_parent: Control, keywords: Array[String], positive: bool):
	for child in keyword_parent.get_children():
		child.queue_free()
		
	for keyword in keywords:
		var keyword_label: SpyNoteKeyword = SpyNoteKeyword.SCENE.instantiate()
		keyword_label.keyword = keyword
		keyword_label.positive = positive
		keyword_parent.add_child(keyword_label)

func get_toggle_action_name() -> String:
	return ""
