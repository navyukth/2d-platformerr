class_name StateIdle extends State

@onready var walk: StateWalk = $"../walk"
@onready var attack: StateAttack = $"../attack"


func Enter() ->void:
	player.UpdateAnimation("idle")
	print("Entering Idle State")
	pass

func Exit() ->void:
	pass
func Process(_delta: float) ->State:
	if player.direction != 0:
		return walk
	player.velocity.x = 0
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
