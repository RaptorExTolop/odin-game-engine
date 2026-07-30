package main

import "core:fmt"

import rl "vendor:raylib"
Vec2 :: rl.Vector2
Rec2 :: rl.Rectangle

main :: proc() {
	rl.InitWindow(1280, 720, "Game Engine")
	rl.SetExitKey(.Q)
	rl.ClearWindowState({.WINDOW_RESIZABLE, .VSYNC_HINT})

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		defer rl.DrawFPS(0, 0)

		rl.ClearBackground(rl.SKYBLUE)

		rl.EndDrawing()
	}
}
