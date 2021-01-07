extends Node2D
onready var win_screen = $UI/CanvasLayer/WinScreen
onready var lose_screen = $UI/CanvasLayer/LoseScreen


func _on_Laval_body_entered(body):
	print("Game over")
	lose_screen.visible = true
	pass # Replace with function body.


func _on_Victory_body_entered(body):
	print("You win")
	win_screen.visible = true
	
	pass # Replace with function body.
