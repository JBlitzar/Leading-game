extends Node2D
var health:float = 1
export (float) var damageamt = 0.05;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal update_health_bar
signal playerdie
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KinematicBody2D_take_damage():
	health -= damageamt
	health = stepify(health, damageamt)
	print(health)
	if (health) > 0:
		emit_signal("update_health_bar", health)
	else:
		emit_signal("playerdie")
