class_name HitBox extends Area2D

signal damaged(hurt_box : HurtBox)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func TakeDamage(hurtbox: HurtBox) ->void:
	#print("Damge took: ",hurtbox.damage)
	damaged.emit(hurtbox)
