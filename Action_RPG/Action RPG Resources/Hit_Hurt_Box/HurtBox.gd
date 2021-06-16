extends Area2D

export(bool) var show_hit = true

const HitEffect = preload("res://Action RPG Resources/Effects/HitEffect.tscn")

var invincible = false setget set_invincible

onready var timer = $Timer

signal invincible_started
signal invincible_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincible_started")
	else:
		emit_signal("invincible_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position


func _on_Timer_timeout():
	self.invincible = false

func _on_HurtBox_invincible_started():
	set_deferred("monitorable", false)	

func _on_HurtBox_invincible_ended():
	monitorable = true
