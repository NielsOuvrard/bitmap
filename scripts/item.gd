extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


@export var type := Data.Item.PotionBlue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match type:
		Data.Item.PotionBlue:
			sprite.animation = "potion_blue"
		Data.Item.PotionGreen:
			sprite.animation = "potion_green"
		Data.Item.Torch:
			sprite.animation = "torch"


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("collect_item"):
		body.collect_item(type)
		queue_free()
