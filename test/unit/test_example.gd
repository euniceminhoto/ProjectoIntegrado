extends "res://addons/gut/test.gd"

var Menu = load("res://cenas/Menu.gd")

class SignalObject:
	func _init():
		add_user_signal('Jogar')
		add_user_signal('Sair')
		add_user_signal('menu')
		add_user_signal('sair')
		add_user_signal('cereais')
		add_user_signal('banana')
		add_user_signal('oleo')
		add_user_signal('vidro')
		add_user_signal('cursor')
		
func test_assert_signal_emitted():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('Jogar')
	gut.p('-- Botão.Jogar.Menu -- passou --')
	assert_signal_emitted(obj, 'Jogar')
	
func test_assert_signal_emitted2():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('Sair')
	gut.p('-- Botão.Sair.Menu -- passou --')
	assert_signal_emitted2(obj, 'Sair')

func test_assert_signal_emitted3():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('menu')
	gut.p('-- Botão.Menu.Score -- passou--')
	assert_signal_emitted3(obj, 'menu')

func test_assert_signal_emitted4():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('sair')
	gut.p('-- Botão.Sair.Score -- passou --')
	assert_signal_emitted4(obj, 'sair')
	
func test_assert_signal_emitted5():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('cereais')
	gut.p('-- Item cereais.jogo --- passou --')
	assert_signal_emitted5(obj, 'cereais')
	
func test_assert_signal_emitted6():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('banana')
	gut.p('-- Item banana.jogo --- passou --')
	assert_signal_emitted6(obj, 'banana')

func test_assert_signal_emitted7():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('oleo')
	gut.p('-- Item oleo.jogo --- passou --')
	assert_signal_emitted7(obj, 'oleo')

func test_assert_signal_emitted8():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('vidro')
	gut.p('-- Item vidro.jogo --- passou --')
	assert_signal_emitted8(obj, 'vidro')

func test_assert_signal_emitted9():
	var obj = SignalObject.new()
	watch_signals(obj)
	obj.emit_signal('cursor')
	gut.p('-- Cursor.jogo --- passou --')
	assert_signal_emitted9(obj, 'cursor')

func test_assert_signal_emit_count():
	var obj_a=SignalObject.new()
	var obj_b=SignalObject.new()
	var obj_c=SignalObject.new()
	var obj_d=SignalObject.new()
	
	watch_signals(obj_a)
	watch_signals(obj_b)
	watch_signals(obj_c)
	watch_signals(obj_d)
	obj_a.emit_signal('vidro')
	obj_b.emit_signal('oleo')
	obj_c.emit_signal('banana')
	obj_d.emit_signal('cereais')
	
	#assert_signal_emit_count(obj_a, 'vidro',1)
	assert_signal_emit_count(obj_b,'oleo',1)
	#assert_signal_emit_count(obj_c,'banana',1)
	assert_signal_emit_count(obj_d,'cereais',1)
	gut.p('-- A contagem de sinal não é nula - o item entra pelo menos uma vez na tela como previsto --')
	assert_signal_emit_count(obj_a,'vidro',0)  # é suposto falhar o teste, pois ele está a emitir um sinal quando entra na tela
	#assert_signal_emit_count(obj_b,'oleo',0)
	assert_signal_emit_count(obj_c,'banana',0) # é suposto falhar o teste, pois ele está a emitir um sinal quando entra na tela
	#assert_signal_emit_count(obj_d,'cereais',0) 

func setup():
	gut.file_touch('user://musica.ogg')

func teardown():
	gut.file_delete('user://musica.ogg')

func test_assert_file_exists():
	gut.p('-- Ficheiro musical -- OK --')
	assert_file_exists('res://addons/gut/gut.gd') # PASS
	assert_file_exists('user://musica.ogg') # PASS

	gut.p('-- Ficheito musical não está disponível --')
	assert_file_exists('user://musica.ogg')
	assert_file_exists('res://musica.ogg')
	
class MovingNode:
	extends Node2D
	var _speed = 2

	func _ready():
		set_process(true)

	func _process(delta):
		set_pos(get_pos() + Vector2(_speed * delta, 0))


func test_illustrate_end_test(): # corre novamente todos os testes e termina os que estiverem pendentes
	yield(yield_for(1), YIELD)
	end_test()