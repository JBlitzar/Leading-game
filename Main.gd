extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_die
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")
	self.connect("playerdie", get_node("/root/MainMenu"), "playerdie")
	$Score.text = "Score: "+str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func playerdie():
	print("DIE main")
	emit_signal("player_die")
	

func _on_Finish_BouyWin():
	score += 1
	$Score.text = "Score: "+str(score)
