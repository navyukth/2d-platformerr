class_name Player extends CharacterBody2D

const JUMP_VELOCITY = -300.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: PlayerStateMachine = $StateMachine
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hit_box: HitBox = $HitBox

signal player_damages( hurt_box : HurtBox)

var invulnerable : bool = false

var hp : int = 6
var max_hp : int = 6

var direction :float
var attacktype:String

func _ready():
	state_machine.Initialize(self)
	hit_box.damaged.connect(TakeDamage)
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("Left", "Right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func UpdateAnimation(state : String) ->void:
	animation_player.play(state)
	pass
	
func TakeDamage(hurt_box : HurtBox) ->void:
	if invulnerable == true:
		return
	UpdateHp( -hurt_box.damage)
	print("Player Took damage: ",hurt_box.damage)
	if hp > 0 :
		player_damages.emit(hurt_box)
	else:
		player_damages.emit(hurt_box)
	
	pass

func UpdateHp( delta : int) -> void:
	hp = clampi(hp + delta , 0 , max_hp)
	pass
	
func MakeInvunerable( _duration : float = 1.0) ->void:
	pass
