class_name EnemeyStateIdle extends EnemyState

@export var anim_name : String ="Idle"

@export_category("AI")
@export var state_duration_min : float = 0.4
@export var state_duration_max : float = 1.5
@export var next_state : EnemyState

var _timer : float = 0.0

func init() -> void:
	pass
	
func Enter() ->void:
	enemy.direction = 0
	_timer = randf_range(state_duration_min , state_duration_max)
	enemy.UpdataAnimation(anim_name)

func Exit() -> void:
	pass

func Process(_delta : float ) ->EnemyState:
	_timer -= _delta
	if _timer <=0:
		return next_state
	return null

func physics(_delta : float) ->EnemyState:
	return null
