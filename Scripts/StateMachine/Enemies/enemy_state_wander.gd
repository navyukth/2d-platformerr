class_name EnemyStateWander extends EnemyState

@export var anim_name: String ="Wander"
@export var wander_speed : float = 20.0

@onready var sprite_2d: Sprite2D = $"../../Sprite2D"

@export_category("AI")
@export var state_animation : float = 1.0
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 3

@export var next_state : EnemyState

var _timer :float = 0.0
var _direction : int

func init() ->void:
	pass
	
func Enter() ->void:
	print("Orc enters wander state")
	_timer = randi_range(state_cycles_min,state_cycles_max) * state_animation
	var rand = randi_range( 0 , 2 )
	_direction=enemy.Dir[ rand ]
	enemy.velocity.x = _direction * wander_speed
	sprite_2d.scale.x = -1 if _direction < 0 else 1
	enemy.UpdataAnimation(anim_name)
	pass

func Exit() -> void:
	pass
	
func Process(_delta : float)-> EnemyState:
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null
	
func Physics(_delta : float) ->EnemyState:
	return null
