extends KinematicBody2D

var velocity = Vector2(500,0)
var rebound_intancity = 100
func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		if collision.collider.is_in_group("wall"):
			velocity.y *=-1

		elif collision.collider.is_in_group("padel"):
			velocity.x *=-1
			velocity.y = y_from_collision(collision)

func y_from_collision(collision):
	var paddle_y_extents=collision.collider.get_node("CollisionShape2D").shape.extents.y
	var normalized_value = (position.y-collision.collider.position.y)/paddle_y_extents
	return normalized_value*rebound_intancity


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().change_scene("res://characters/Main.tscn")
