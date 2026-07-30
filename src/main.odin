package main

import "core:fmt"
import "world"
import rl "vendor:raylib"
Vec2 :: rl.Vector2
Rec2 :: rl.Rectangle

create_window :: proc() {
	rl.InitWindow(1280, 720, "Game Engine")
	rl.SetExitKey(.Q)
	rl.ClearWindowState({.WINDOW_RESIZABLE, .VSYNC_HINT})
}

sys_move_and_slide :: proc(self: ^world.World, dt: f32) {
	
}

main :: proc() {
	create_window()

	gWorld := world.new_world()
	defer world.delete_world(&gWorld)

	player := world.create_entity(&gWorld)
	gWorld.positions[player] = {100, 100}
	gWorld.velocities[player] = {10, 10}

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		defer rl.DrawFPS(0, 0)

		rl.ClearBackground(rl.SKYBLUE)

		rl.EndDrawing()
	}
}
