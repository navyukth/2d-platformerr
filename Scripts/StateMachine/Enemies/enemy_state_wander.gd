class_name EnemyStateWander extends EnemyState

@export var anim_name: String ="Wander"
@export var wander_speed : float = 20.0

@export_category("AI")
@export var state_animation : float = 0.5

@export var state_cycles_min:int =1
@export var state_cycles_max:int =3

@export var next_state : EnemyState

var _timer :float = 0.0
var _direction

func init() ->void:
	pass
	
func Enter() ->void:
	pass
