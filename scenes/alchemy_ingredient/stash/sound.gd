extends RandomPitchAudioStreamPlayer

func _on_ingredient_stash_ingredient_picked_up(ingredient):
	play_with_random_pitch()
