extends Control

@onready var _master_slider: SliderSettings = %MasterSlider
@onready var _sfx_slider: SliderSettings = %SFXSlider
@onready var _music_slider: SliderSettings = %MusicSlider

func _ready() -> void:
	_master_slider.init_slider("Master", 75)
	_sfx_slider.init_slider("SFX", 75)
	_music_slider.init_slider("Music", 75)
	_connect_signals()

func _connect_signals() -> void:
	_master_slider.value_changed.connect(_on_value_changed_master)
	_sfx_slider.value_changed.connect(_on_value_changed_sfx)
	_music_slider.value_changed.connect(_on_value_changed_music)

func _on_value_changed_master(value: int) -> void:
	SoundManager.set_master_to(value)
	($AudioStreamPlayer as AudioStreamPlayer).play()

func _on_value_changed_sfx(value: int) -> void:
	SoundManager.set_sfx_to(value)

func _on_value_changed_music(value: int) -> void:
	SoundManager.set_music_to(value)
