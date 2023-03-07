extends CharacterBody3D

@onready var animation_tree: AnimationTree = $AnimationTree

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		if not is_on_floor():
			print("can't jump. not on floor")
		else:
			velocity = Vector3(0, 100, 0)
			move_and_slide()
			animation_tree['parameters/OneShot/request'] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

func _physics_process(delta: float) -> void:
	velocity = Vector3(0, -3, 0)
	move_and_slide()
