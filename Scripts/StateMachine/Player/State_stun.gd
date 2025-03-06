class_name StateStun extends State

@export var knockback_speed : float = 200.0
@export var decelerate_speed : float = 10.0
@export var invulnerable_duration : float = 1.0

@onready var idle: StateIdle = $"../Idle"

var next_state : State = null

var hurt_box : HurtBox
var directon : Vector2


func init() -> void:
	player.player_damages.connect(_player_damage)
	pass

func _ready() -> void:
	pass

func Enter() -> void:
	print("Entring Stun State")
	player.animation_player.animation_finished.connect(_animation_finished)
	
	directon.x = player.global_position.direction_to(hurt_box.global_position).x
	player.velocity.x = directon.x * -knockback_speed
	player.UpdateAnimation("Stun")
	player.MakeInvunerable( invulnerable_duration )
	
	pass
	
func Exit() ->void:
	next_state=null
	player.animation_player.animation_finished.disconnect(_animation_finished)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Process(_delta: float) -> State:
	player.velocity.x -= player.velocity.x * decelerate_speed * _delta
	return next_state

func Physics(_delta: float) ->State:
	return null


func _player_damage(_hurtbox: HurtBox) ->void:
	hurt_box = _hurtbox
	state_machine.ChangeState(self)
	pass

func _animation_finished(_a : String) ->void:
	next_state = idle
