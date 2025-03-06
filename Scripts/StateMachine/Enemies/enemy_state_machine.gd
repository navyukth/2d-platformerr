class_name EnemyStatMachine extends Node

var States : Array[ EnemyState ]
var prev_state : EnemyState
var current_state : EnemyState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode=Node.PROCESS_MODE_DISABLED
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(current_state.Process( delta ))
	pass

func _physics_process(delta: float) -> void:
	ChangeState(current_state.Physics( delta ))
	pass
	
func Initialize( _enemy : Enemy) ->void:
	States = [] 
	for c in get_children():
		if c is EnemyState:
			States.append(c)
	
	for s in States:
		s.enemy = _enemy
		s.state_machine = self
		s.init()
	
	if States.size() > 0:
		ChangeState( States[0] )
		process_mode=Node.PROCESS_MODE_INHERIT
		
func ChangeState(new_state : EnemyState ) -> void:
	if new_state == null || new_state == current_state:
		return
	if current_state:
		current_state.Exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.Enter()
