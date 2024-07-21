class_name Player extends Entity

const run_speed: int = 300
const walk_speed: int = 100
@export var animation_player: AnimationPlayer
@export var hp_manager: HealthPointsManager

func _ready() -> void:
	animation_player.play("Player/idle")
	hp_manager.health_decreased.connect(_on_damaged)

func _physics_process(delta: float) -> void:
	_move()
	super._physics_process(delta)

func _move() -> void:
	var move_speed: int = walk_speed if Input.is_action_pressed("walk") else run_speed
	velocity = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized() * move_speed

func _on_damaged(_new_health_amount: int, _previous_health_amount: int) -> void:
	GlobalEvents.player_damaged.emit()
