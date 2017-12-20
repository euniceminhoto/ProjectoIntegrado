extends SceneTree  
func _init():  
    load('res://Scripts/unittest.gd').run([
        'res://test/teste.gd',
    ])
    quit()