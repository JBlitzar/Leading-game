class_name Human
extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var follownode
var mounted = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = false
func dismount():
	mounted = false
	follownode.passenger =  null
	follownode.has_passenger = false
	follownode = null
	$CollisionShape2D.set_deferred("disabled", false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if follownode:
		global_position = follownode.global_position


func _on_Human_body_entered(body):
	if body.get_collision_layer() == 4:
		#Collided with wood
		DIE()
	if body.get_collision_layer() == 32769 and not body.has_passenger:
		#Collided with bouy
		$CollisionShape2D.set_deferred("disabled", true)
		follownode = body
		body.has_passenger = true
		body.passenger = self
		mounted = true


func DIE():
	$AnimationPlayer.play("Die")


func _on_AnimationPlayer_animation_finished(anim_name):
	call_deferred("queue_free")
