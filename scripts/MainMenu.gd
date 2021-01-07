extends Control




func quit_game():
	get_tree().quit()
	



func _on_QuitButton_pressed():
	quit_game()


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Level1.tscn")
