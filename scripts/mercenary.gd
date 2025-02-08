class_name Mercenary
extends Node

static var max_id = 0

var id: int
var long_name: String
var short_name: String

var agility: int = 80
var dexterity: int = 80
var strength: int = 80
var leadership: int = 40
var wisdom: int = 70
var level: int = 1
var marksmanship: int = 50
var mechanics: int = 20
var explosives: int = 20
var medical: int = 20

var big_slots = []
var small_slots = []

func _init(name_short:String="Verb", name_long:String="Guyase Verb") -> void:
	max_id += 1
	id = max_id
	short_name = name_short
	long_name = name_long
	
