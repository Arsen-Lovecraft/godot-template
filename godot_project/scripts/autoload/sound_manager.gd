class_name SoundManagerClass
extends Node

var _master_sound_level: int = 75:
	get():
		return _master_sound_level
	set(value):
		if(value > 100 or value <0):
			return
		else:
			_master_sound_level = value
var _sfx_sound_level: int = 75:
	get():
		return _sfx_sound_level
	set(value):
		if(value > 100 or value <0):
			return
		else:
			_sfx_sound_level = value
var _music_sound_level: int = 75:
	get():
		return _music_sound_level
	set(value):
		if(value > 100 or value < 0):
			return
		else:
			_music_sound_level = value

func _ready() -> void:
	set_master_to(75)
	set_music_to(75)
	set_sfx_to(75)

func set_master_to(value: int) -> void:
	_master_sound_level = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), _volume_to_db(_master_sound_level))

func set_sfx_to(value: int) -> void:
	_sfx_sound_level = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), _volume_to_db(_sfx_sound_level))

func set_music_to(value: int) -> void:
	_music_sound_level = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), _volume_to_db(_music_sound_level))

func _volume_to_db(volume: float) -> float:
	if volume <= 0:
		return -80
	return 20 * log(volume / 100.0)

func _db_to_volume(db: float) -> float:
	if db <= -80:
		return 0
	return 100 * pow(10, db / 20.0)
