extends CharacterBody2D

@onready var raycast: RayCast2D = $RayCast2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 50.0
const JUMP_VELOCITY = -400.0


@export var direction := Vector2.RIGHT

func change_direction():
	direction = direction * -1
	raycast.target_position *= -1
	sprite.flip_h = direction.x < 0

func _ready() -> void:
	sprite.play("walk")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if raycast.is_colliding():
		change_direction()

	if direction:
		velocity.x = direction.x * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
