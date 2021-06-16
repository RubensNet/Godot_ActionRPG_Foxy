extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var hearthUiFull = $HealthUiFull
onready var hearthUiEmpty = $HealthUiEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if hearthUiFull != null:
		hearthUiFull.rect_size.x = hearts * 15

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if hearthUiEmpty != null:
		hearthUiEmpty.rect_size.x = max_hearts * 15

func _ready():
	self.max_hearts = PlayerStatus.max_health
	self.hearts = PlayerStatus.health
	PlayerStatus.connect("health_changed", self, "set_hearts")
	PlayerStatus.connect("max_health_changed", self, "set_max_hearts")
