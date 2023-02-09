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
	follownode.has_passenger = false
	follownode = null
	print("dismount")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if follownode:
		$CollisionShape2D.disabled = true
		global_position= follownode.global_position


func _on_Human_body_entered(body):
	print("collide", body.get_collision_layer())
	if body.get_collision_layer() == 4:
		#Collided with wood
		DIE()
	if body.get_collision_layer() == 32769 and not body.has_passenger:
		#Collided with bouy
		print("mount on")
		follownode = body
		body.has_passenger = true
		mounted = true


func DIE():
	$AnimationPlayer.play("Die")


func _on_AnimationPlayer_animation_finished(anim_name):
	call_deferred("queue_free")
