extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2

signal player_collided
func _ready():
	self.connect("player_collided", get_node("/root/MainMenu/Main/Player and Tow/KinematicBody2D"), "_on_player_collided")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Wood_body_entered(body):
	if body.get_collision_layer() == 1:
		#Player or Tow
		emit_signal("player_collided")


func _on_DespawnTimer_timeout():
	$AnimationPlayer.play("Boat sink")


func _on_AnimationPlayer_animation_finished(anim_name):
	call_deferred("queue_free")
