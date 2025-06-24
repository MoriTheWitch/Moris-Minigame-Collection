extends Node2D

var snakeAlive = true
var speed:int = 1
var velocity:Vector2 = Vector2.ZERO

@onready
var head = $SnakeHead

@onready
var tail = $SnakeTail

@onready
var segmentsArr: Array = [head, $SnakeSegment, tail ]

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
	if velocity != Vector2.ZERO:
		if velocity.x != 0:
			head.position.x = head.position.x + (32 * velocity.x)
			if velocity.x == -1:
				head.rotation_degrees = 90
			else:
				head.rotation_degrees = 270
		elif velocity.y != 0:
			head.position.y = head.position.y + (32 * velocity.y)
			if velocity.y == -1:
				head.rotation_degrees = 180
			else:
				head.rotation_degrees = 0
		for i in range(1, segmentsArr.size()-1):
			var segment = segmentsArr[i]
			var currentPosition = segment.position
			segment.position = oldPosition
			oldPosition = currentPosition
		tail.position = oldPosition
		for i in range(1, segmentsArr.size()-1):
			setSegmentRotation(segmentsArr[i-1], segmentsArr[i], segmentsArr[i+1])
		setTailRotation()




func setSegmentRotation(prevSegment, segment:Node2D, nextSegment:Node2D):
	var segmentSprite = segment.get_node("AnimatedSprite2D")
	var positionDifferenceFront: Vector2 =  prevSegment.position - segment.position
	var positionDifferenceBack: Vector2 =   segment.position - nextSegment.position
	var combinedPosition: Vector2 = positionDifferenceBack + positionDifferenceFront
	print(combinedPosition)
	if combinedPosition.x != 0 and combinedPosition.y == 0:
		segment.rotation_degrees = 90
		segmentSprite.frame = 0
	elif combinedPosition.x == 0 and combinedPosition.y != 0:
		segment.rotation_degrees = 0
		segmentSprite.frame = 0
	else:
		segmentSprite.frame = 1
		if combinedPosition.x == 32 and combinedPosition.y == 32: 
			segment.rotation_degrees = 0
		elif combinedPosition.x == -32 and combinedPosition.y == 32: 
			segment.rotation_degrees = 90
		elif combinedPosition.x == 32 and combinedPosition.y == -32: 
			segment.rotation_degrees = 270
		elif combinedPosition.x == -32 and combinedPosition.y == -32: 
			segment.rotation_degrees = 180


func setTailRotation():
	var lastSegment = segmentsArr[segmentsArr.size()-2]
	var positionDifference: Vector2 = lastSegment.position - tail.position
	if positionDifference.x != 0:
		if positionDifference.x < 0:
			tail.rotation_degrees = 90
		else:
			tail.rotation_degrees = 270
	if positionDifference.y != 0:
		if positionDifference.y < 0:
			tail.rotation_degrees = 180
		else:
			tail.rotation_degrees = 0
