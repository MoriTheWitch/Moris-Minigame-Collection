extends Node2D

var gameRunning: bool = true
var gameStateArr = [[0,0,0],[0,0,0],[0,0,0]]
@onready
var tickboxArr= [$Tickbox, $Tickbox2, $Tickbox3, $Tickbox4, $Tickbox5, $Tickbox6, $Tickbox7, $Tickbox8, $Tickbox9]

var winner = 0;

func _process(delta: float) -> void:
	setGameState()
	checkGameState()


func setGameState() -> void:
	var tickCount = 0
	for i in range(0,3):
		var row = gameStateArr.get(i)
		for j in range(0,3):
			var currentTick = tickboxArr.get(tickCount)
			
			row.set(j, currentTick.getPlayer())
			tickCount += 1
		gameStateArr.set(i, row)

func checkGameState():
	var winState: bool = checkWin()
	var drawState: bool = checkDraw()
	
	if winState:
		$Control.visible = true
		$Control/Label.text ="Player " + str(winner) + " wins"
	elif drawState:
		$Control.visible = true
		$Control/Label.text ="Draw"


func checkDraw()-> bool:
	var drawState = true
	for arr in gameStateArr:
		for i in arr:
			if i == 0:
				drawState = false
	return drawState

func checkWin() -> bool:
	var winState = false
	
	for arr in gameStateArr:
		if arr == [1,1,1]:
			winner = 1
		elif arr == [2,2,2]:
			winner = 2

	for i in range(0, gameStateArr.size()):
		if gameStateArr[0][i] == 1 and gameStateArr[1][i] == 1 and gameStateArr[2][i] == 1:
			winner = 1
		elif gameStateArr[0][i] == 2 and gameStateArr[1][i] == 2 and gameStateArr[2][i] == 2:
			winner = 2
			
	if gameStateArr[1][1] == 1 and ((gameStateArr[0][0]  == 1 and gameStateArr[2][2] == 1) or (gameStateArr[0][2] == 1  and gameStateArr[2][0] == 1)):
		winner = 1
	elif gameStateArr[1][1] == 2 and ((gameStateArr[0][0]  == 2 and gameStateArr[2][2] == 2) or (gameStateArr[0][2] == 2  and gameStateArr[2][0] == 2)):
		winner = 2
	
	if winner != 0:
		winState = true
	return winState
		


func _on_quit_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/Menues/GameSelect/GameSelect.tscn") 



func _on_restart_pressed() -> void:
		get_tree().change_scene_to_file("res://Scenes/Minigames/TicTacToe/TicTacMainScene.tscn") 
