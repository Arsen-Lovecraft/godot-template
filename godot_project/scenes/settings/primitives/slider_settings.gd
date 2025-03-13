class_name SliderSettings
extends Control

signal value_changed(value: int)

var percent: int = 75:
	get():
		return percent
	set(value):
		if(value > 100 or value < 0):
			return
		else:
			percent = value

@onready var _pre_label: Label = %PreLabel
@onready var _h_slider: HSlider = %HSlider
@onready var _post_label: Label = %PostLabel

func _ready() -> void:
	_connect_signals()

func _connect_signals() -> void:
	_h_slider.value_changed.connect(_on_value_changed)

func _on_value_changed(value: float) -> void:
	percent = int(value)
	value_changed.emit(int(value))
	_post_label.text = str(percent) + "%"

func init_slider(slider_name: String, value: int) -> void:
	_pre_label.text = slider_name
	percent = value
	_post_label.text = str(percent) + "%"
	_h_slider.value = percent
