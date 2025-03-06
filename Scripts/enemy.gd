class_name Enemy extends CharacterBody2D

signal enemy_damaged(hurt_box : HurtBox)
const Dir= [ -1, 0 , 1]
@export var hp : int = 3

var player : Player
var invulnerable : bool =false
var direction :int = 0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hit_box: HitBox = $HitBox
@onready var enemy_state_machine: EnemyStatMachine = $Enemy_State_Machine

func _ready() -> void:
	enemy_state_machine.Initialize(self)
	hit_box.damaged.connect(_on_take_damage)
	pass
	
func _process(_delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
	pass


func UpdataAnimation(state: String) ->void:
	animation_player.play(state)
	pass

func _on_take_damage(hurt_box : HurtBox) -> void:
	if invulnerable == true:
		return
		
	hp -= hurt_box.damage
	print("Orc Took damage: ",hurt_box.damage)
	
	if hp > 0 :
		enemy_damaged.emit(hurt_box)
	else:
		enemy_damaged.emit(hurt_box)
