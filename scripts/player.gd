extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var SPEED = 100.0
var JUMP_VELOCITY = -200.0

func collect_item(type: Data.Item):
	match type:
		Data.Item.PotionBlue:
			SPEED = 200.0
		Data.Item.PotionGreen:
			JUMP_VELOCITY = -300.0
		Data.Item.Torch:
			$Torch.visible = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		sprite.play("walk")
		velocity.x = direction * SPEED
		sprite.flip_h = direction < 0
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
