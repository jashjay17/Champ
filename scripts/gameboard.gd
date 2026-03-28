extends Node2D
class_name level_creator
@export var stage_level: int 
@onready var user_word: LineEdit = $"User word"
@onready var current_word: Label = $"Current word"
@onready var confirm: Button = $confirm
@onready var count_down: Timer = $"count down"
var lives = 5
var morning = [
	"singer","tennis","gamer","love","batter","about","other","which","their","there","would","these","click","state","email","world","music",
"after","video","where","books","links","years","order","items","group","under","games","could","great","hotel","store","terms","right","local",
"those","using","phone","forum","based","black","index","being","women","today","south","pages","found","house","photo","power","while","three",
"total","place","think","posts","since","guide","board","small","times","sites","level","hours","image","title","shall","class","still",
"money","every","visit","tools","reply","value","learn","print","stock","point","sales","large","table","start","model","human","march",
"yahoo","going","study","staff","again","april","never","users","below"]
var afternoon = [
  "search","online","people","health","should","system","policy","number","please","rights","public","school","review","united","center","travel","report","member","before","hotels",
  "office","design","posted","within","states","family","prices","sports","county","access","change","rating","during","return","events","little","movies","source","author","around",
  "course","canada","credit","estate","select","photos","thread","market","really","action","series","second","forums","better","friend","server","issues","street","things","person",
  "mobile","offers","recent","stores","memory","social","august","create","single","latest","status","browse","seller","always","result","groups","making","future","london","become",
  "garden","listed","energy","images","notice","others","format","months","safety","having","common","living","called","period","window","france","region","island","record","direct"]

var night = ["good","job","on","the","completion","of","this","training","course",
"you","have","come","along","way","since","stepping","foot","inside",
"this","cube","many","believe","that","it","is","a","place","of",
 "despair","but","you","are","different","you","tried","hard","until",
  "you","lost","the","will","to","go","on","but","still","kept",
  "pushing","yourself","when","no","one","else","could","give",
  "yourself","a","huge","pat","on","the","back","as","it","is",
  "time","to","leave","this","cube","and","step","back","into","the",
  "real","world","your","family","and","friends","that","you","dont",
  "and","never","will","have","are","close","so","dont","keep",
  "them","waiting","brother"]


var word = null
var x = 0
@onready var gameplay: Node2D = $"../gameplay"
var game_level = 1
var misses_left = 5
@onready var misses: AnimatedSprite2D = $misses
var score = 0
@onready var vis_score: Label = $vis_score
@onready var boom: AnimatedSprite2D = $boom


func _ready() -> void:
	if stage_level == 1:
		word = morning
	elif stage_level == 2:
		word = afternoon
	elif stage_level == 3:
		word = night
	_game()




func _game():
	var selection = randi_range(0,95)

	current_word.text = word[selection]
	count_down.start(6-stage_level)
	return current_word.text
	
func _process(delta: float) -> void:
	if misses_left == 5:
		misses.play("5 left")
	elif misses_left == 4:
		misses.play("4 left")
	elif misses_left == 3:
		misses.play("3 left")
	elif misses_left == 2:
		misses.play("2 left")
	elif misses_left == 1:
		misses.play("1 left")
	elif misses_left == 0:
		if stage_level == 1:
			get_tree().change_scene_to_file("res://scences/failure.tscn")
		elif stage_level == 2:
			get_tree().change_scene_to_file("res://scences/afternoon_failure.tscn")
		elif stage_level == 3:
			get_tree().change_scene_to_file("res://scences/night_fail.tscn")
	vis_score.text = str(score)








func _on_user_word_text_submitted(_new_text: String):
	print(user_word.text)
	if current_word.text == user_word.text:
		gameplay.answer = 1
		score = score + 1
		boom.play("boom")
		print("correct")
		user_word.clear()
		_game()
	else:
		gameplay.answer = -1
		misses_left = misses_left - 1
		if lives > 0:
			_game()
			user_word.clear()
		elif lives == 0:
			if stage_level == 1:
				get_tree().change_scene_to_file("res://scences/failure.tscn")
			elif stage_level == 2:
				get_tree().change_scene_to_file("res://scences/afternoon_failure.tscn")
			elif stage_level == 3:
				get_tree().change_scene_to_file("res://scences/night_fail.tscn")



func _on_count_down_timeout() -> void:
	print("life lost")
	lives = lives - 1
	if lives == 0:
		print("you loose")
		count_down.stop()
		
		if stage_level == 1:
			get_tree().change_scene_to_file("res://scences/failure.tscn")
		elif stage_level == 2:
			get_tree().change_scene_to_file("res://scences/afternoon_failure.tscn")
		elif stage_level == 3:
			get_tree().change_scene_to_file("res://scences/night_fail.tscn")
	elif lives >= 0:
		_game()
		misses_left = misses_left - 1
		user_word.clear()
	
