extends Area2D

const BGScript = preload("res://Scenes/Minigames/TicTacToe/Scripts/BGScript.gd")
var is_Set: bool = false

var player: int = 0

@onready
var OSprite = $Sprite2D/OSprite
@onready
var XSprite = $Sprite2D/XSprite



func _on_mouse_entered() -> void:
	if BgScript.player and not is_Set:
		OSprite.visible = true
	elif not BgScript.player and not is_Set:
		XSprite.visible = true
	 # Replace with function body.


func _on_mouse_exited() -> void:
	if BgScript.player and not is_Set:
		OSprite.visible = false
	elif not BgScript.player and not is_Set:
		XSprite.visible = false


func _on_clickm1_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if BgScript.player:
				player = 1
			else:
				player = 2
			BgScript.Switch_Player()
			print(BgScript.player)
			is_Set = true

func getPlayer() -> int:
	return player
