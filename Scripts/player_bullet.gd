extends Node2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var speed = 900
var spawntime = Time.get_ticks_msec()
var damage = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position += Vector2(10,0)
	damage = PlayerDataNode._get_damage()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta,0)
	if ($RayCast2D.is_colliding()):
		var enemy_hit = $RayCast2D.get_collider()
		print(enemy_hit)
		enemy_hit.get_parent().on_hit(damage)
		self.queue_free()
	if (Time.get_ticks_msec() - spawntime > 15000):
		self.queue_free()
	
