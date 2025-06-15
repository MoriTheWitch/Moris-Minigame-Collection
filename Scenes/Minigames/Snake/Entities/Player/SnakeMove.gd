extends Node2D

var snakeAlive = true
var speed:int = 1
var velocity:Vector2 = Vector2.ZERO

@onready
var segmentsArr: Array = [head, $SnakeSegment, $SnakeTail ]

@onready
var head = $SnakeHead

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") :
		velocity = Vector2.LEFT
	elif Input.is_action_just_pressed("ui_right"):
		velocity = Vector2.RIGHT
	elif Input.is_action_just_pressed("ui_down"):
		velocity = Vector2.DOWN
	elif Input.is_action_just_pressed("ui_up"):
		velocity = Vector2.UP



func _on_timer_timeout() -> void:
	snakeMove()



func snakeMove():
	var oldPosition = head.position

	if velocity.x != 0:
		head.position.x = head.position.x + (32 * velocity.x)	
	elif velocity.y != 0:
		head.position.y = head.position.y + (32 * velocity.y)
	for segment in segmentsArr:
		var currentPosition = segment.position
		segment.position = oldPosition
		oldPosition = currentPosition
