extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var wood
onready var screensize = get_viewport().get_visible_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_WoodTimer_timeout():
	var log_inst = wood.instance()
	var log_spawn_location = $Path2D/PathFollow2D
	log_spawn_location.offset = randi()
	var direction = log_spawn_location.rotation + PI / 2
	log_inst.position = log_spawn_location.position
	direction += rand_range(-PI / 4, PI / 4)
	log_inst.rotation = direction
	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	log_inst.linear_velocity = velocity.rotated(direction)
	add_child(log_inst)
