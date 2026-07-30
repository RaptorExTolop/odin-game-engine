package world

import rl "vendor:raylib"
Vec2 :: rl.Vector2
Rec2 :: rl.Rectangle

Entity :: distinct u32

Position :: distinct Vec2
Velocity :: distinct Vec2

World :: struct {
	nextId: Entity,

	positions: map[Entity]Position,
	velocities: map[Entity]Velocity,
}

new_world :: proc() -> World {
	return {
		nextId = 0,

		positions = make(map[Entity]Position), 
		velocities = make(map[Entity]Velocity), 
	}
}

delete_world :: proc(self: ^World) {
	delete(self.velocities)
	delete(self.positions)
}

create_entity :: proc(self: ^World) -> Entity {
	id := self.nextId
	self.nextId += 1
	return id
}

