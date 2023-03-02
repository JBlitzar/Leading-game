extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal playerdie
var score = 0
# Called when the node enters the scene tree for the first time.
func _ready(): 
	$Score.text = "Score: "+str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
	
	

func _on_Finish_BouyWin():
	score += 1
	$Score.text = "Score: "+str(score)


func _on_Player_and_Tow_playerdie():
	print("DIE main")
	emit_signal("playerdie")
