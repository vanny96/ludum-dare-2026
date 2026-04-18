@tool
class_name SpyNoteKeyword extends RichTextLabel

const SCENE = preload("uid://bqcbge8v2lsmy")

@export var keyword: String :
	set(p_keyword):
		keyword = p_keyword
		if(keyword):
			_update_text.call_deferred()
			
@export var positive: bool = true

@export_subgroup("Internal")
@export var keyword_template: String
@export var positive_color: Color
@export var negative_color: Color

func _update_text():
	var color: Color
	if positive:
		color = positive_color
	else:
		color = negative_color
	text = keyword_template.format({
		"color": "%x" % color.to_rgba32(),
		"keyword": keyword
	})
