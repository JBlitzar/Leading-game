extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5
export (float) var friction = 0.95
signal take_damage
signal player_die
export (float) var damageamt = 0.05;
var health: float = 1.0
onready var screensize = get_viewport_rect().size
var velocity = Vector2()
var rotation_dir = 0
func _ready():
	var animation = $Sprite/AnimationPlayer.play("Boat")
	yield(get_tree(), "idle_frame")
	self.connect("playerdie", get_node("/root/MainMenu/Main"), "playerdie")
func get_input():
	rotation_dir = 0
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)
func take_damage():
	emit_signal("take_damage", damageamt)
func _on_player_collided():
	health -= damageamt
	if health >= 0:
		take_damage()
	else:
		emit_signal("player_die")
	
	
	

func _physics_process(delta):
	screensize = get_viewport_rect().size
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity *= friction
	
	velocity = move_and_slide(velocity)
