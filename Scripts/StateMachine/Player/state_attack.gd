class_name StateAttack extends State


@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

@onready var walk: StateWalk = $"../walk"
@onready var idle: StateIdle = $"../Idle"

@export_range(1,20,0.5) var decelerate_speed : float = 5

@export var move_speed :float =100.0
var attacking : bool = false

func Enter() ->void:
	print("Entring Attack State")
	
	attacking = true
	if attacking ==true:
		if  player.attacktype=="heavy":
			player.UpdateAnimation("attack_heavy")
			animation_player.animation_finished.connect(EndAttack)
			
		elif player.attacktype=="lite":
			player.UpdateAnimation("attack_lite")
			animation_player.animation_finished.connect(EndAttack)
	pass

func Exit() ->void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass
	
func Process(_delta: float) ->State:
	player.velocity.x=decelerate_speed * player.velocity.x * _delta
	if attacking == false:
		if player.direction == 0:
			return idle
		else:
			return walk 
	return null

func Physics(_delta: float) ->State:
	return null
	
func HandleInput(_event: InputEvent) ->State:
	return null

func EndAttack(_newAnimation : String) ->void:
	attacking=false
