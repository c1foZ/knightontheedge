extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

@onready var green_animated_sprite_2d = $GreenAnimatedSprite2D
@onready var red_animated_sprite_2d = $RedAnimatedSprite2D

enum ColorOfSlime {Red, Green}

@export var color_of_slime : ColorOfSlime

var animated_sprite_2d

func _ready():
	match color_of_slime:
		ColorOfSlime.Red:
			red_animated_sprite_2d.visible = true
			animated_sprite_2d = red_animated_sprite_2d
		ColorOfSlime.Green:
			green_animated_sprite_2d.visible = true
			animated_sprite_2d = green_animated_sprite_2d
			
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += direction * SPEED * delta 
