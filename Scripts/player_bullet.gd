extends Node2D
@onready var PlayerDataNode = get_tree().get_root().get_node("Game").get_child(1)
var speed = 900
@onready var spawntime = get_tree().create_timer(15) 
var damage:int
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position += Vector2(10,0)
	damage = PlayerDataNode._get_damage()
	spawntime.connect("timeout", self.queue_free)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position += Vector2(speed * delta,0).rotated(self.rotation)
	if ($RayCast2D.is_colliding()):
		var enemy_hit = $RayCast2D.get_collider()
		enemy_hit.get_parent().on_hit(damage)
		self.queue_free()
