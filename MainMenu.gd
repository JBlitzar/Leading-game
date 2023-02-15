extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var gamescene
var inst
# Called when the node enters the scene tree for the first time.
func _ready():
	$MenuUI/GameOver.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func playerdie():
	print("DIE mainmenu")
	$MenuUI/GameOver.show()
	inst.hide()

func _on_Button_pressed():
	inst = gamescene.instance()
	add_child(inst)
	$MenuUI/StartGame.hide()
