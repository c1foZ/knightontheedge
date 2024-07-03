extends Node

signal score_changed(new_score)

var score := 0:
	set(value):
		score = clamp(value, 0, 10)
		score_changed.emit(score)
		
@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	
func _on_score_changed(new_score):
	print(new_score)
