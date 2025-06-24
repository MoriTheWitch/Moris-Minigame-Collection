extends Control


func _on_back_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/Menues/Main/main_menu.tscn") # Replace with function body.
 # Replace with function body.


func _on_tic_tac_toe_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/Minigames/TicTacToe/TicTacMainScene.tscn") # Replace with function body.


func _on_snake_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Minigames/Snake/MainScene/SnakeGame.tscn") # Replace with function body.
