extends Control




func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menues/GameSelect/GameSelect.tscn") # Replace with function body.


func _on_merp_pressed() -> void:
	$MERP/MerpSound.play() # Replace with function body.
