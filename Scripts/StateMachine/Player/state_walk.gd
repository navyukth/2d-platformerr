class_name StateWalk extends State

@onready var idle: StateIdle = $"../Idle"
@onready var attack: StateAttack = $"../attack"

@export var move_speed :float =100.0

func _ready() -> void:
	pass

func Enter() ->void:
	if player.direction < 0:
		player.sprite_2d.scale.x=-1
		player.UpdateAnimation("walk")
		print("Entering Left State")
		
	if player.direction > 0:
		player.sprite_2d.scale.x=1
		player.UpdateAnimation("walk")	
		print("Entering Right State")
	pass

func Exit() ->void:
	pass
	
func Process(_delta: float) ->State:
	if player.direction == 0:
		return idle
	
	if player.direction:
		player.velocity.x = player.direction * move_speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, move_speed)
	return null

func Physics(_delta: float) ->State:
	return null

func HandleInput(_event: InputEvent) ->State:
	if _event.is_action_pressed("Attack_lite"):
		player.attacktype="lite"
		return attack
	elif _event.is_action_pressed("Attack_heavy"):
		player.attacktype="heavy"
		return attack
	return null
