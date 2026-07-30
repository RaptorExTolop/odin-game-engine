package main

import "core:fmt"

import rl "vendor:raylib"
Vec2 :: rl.Vector2
Rec2 :: rl.Rectangle

create_window :: proc() {
	rl.InitWindow(1280, 720, "Game Engine")
	rl.SetExitKey(.Q)
	rl.ClearWindowState({.WINDOW_RESIZABLE, .VSYNC_HINT})
}

update :: proc(id: u32) { fmt.printf("Updating entity: {}\n", id) }

draw :: proc(id: u32) { fmt.printf("Drawing entity: {}\n", id) }

main :: proc() {
	create_window()

	drawable: [dynamic]u32
	updatable: [dynamic]u32

	e1: u32 = 0
	append(&drawable, e1)
	append(&updatable, e1)
	e2: u32 = 1
	append(&drawable, e2)
	e3: u32 = 2
	append(&updatable, e3)

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		defer rl.DrawFPS(0, 0)

		rl.ClearBackground(rl.SKYBLUE)
		for entity in updatable {
			update(entity)
		}

		for entity in drawable {
			draw(entity)
		}

		rl.EndDrawing()
	}
}
