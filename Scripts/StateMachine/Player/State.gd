class_name State extends Node

static var player : Player
static var state_machine: PlayerStateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init() -> void:
	pass

func Enter() -> void:
	pass
	
func Exit() ->void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta: float) -> State:
	return null

func Physics(_delta: float) ->State:
	return null

func HandleInput(_event : InputEvent)-> State:
	return null
