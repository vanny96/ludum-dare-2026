extends BaseButton

@export var input_action: InputEventAction

func _ready() -> void:
	pressed.connect(Input.parse_input_event.bind(input_action))
