class_name EnemeyStateStun extends EnemyState

@export var anim_name : String ="Stun"
@export var konckback_speed : float = 200.0
@export var decelerate_speed : float = 10.0


@export_category("AI")
@export var next_state : EnemyState

var _damage_positon : Vector2
var _direction : float
var _animation_finshed  : bool = false

func init() -> void:
	enemy.enemy_damaged.connect(_on_enemy_damaged)
	pass
	
func Enter() ->void:
	print("Orc enters stun state")
	enemy.invulnerable = true
	_animation_finshed=false

	_direction = enemy.global_position.direction_to( _damage_positon ).x
	enemy.velocity.x = _direction * -konckback_speed
	
	enemy.UpdataAnimation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finshed)
	pass

func Exit() -> void:
	enemy.invulnerable = false
	enemy.animation_player.animation_finished.disconnect(_on_animation_finshed)
	pass

func Process(_delta : float ) ->EnemyState:
	if _animation_finshed == true:
		return next_state
	enemy.velocity.x -= enemy.velocity.x * decelerate_speed * _delta
	return null

func physics(_delta : float) ->EnemyState:
	return null

func _on_enemy_damaged(hurt_box : HurtBox) ->void:
	_damage_positon = hurt_box.global_position
	state_machine.ChangeState(self)
	pass

func _on_animation_finshed(_a : String) ->void:
	_animation_finshed = true
	pass
