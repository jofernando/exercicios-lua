luaunit = require('luaunit')
tabuleiroR = require('tabuleiro')
jogadorR = require('jogador')
jogadorR.simbolo = "X"

function testeJogadaValida()
	local tabuleiro = tabuleiroR:instanciar()
	luaunit.assertEquals(tabuleiro:jogada(1, 1, jogador), true)
end

function testeJogadaValidaPosicao()
	local tabuleiro = tabuleiroR:instanciar()
	local jogador = jogadorR:instanciar()
	tabuleiro:jogada(1, 1, jogador)
	luaunit.assertEquals(tabuleiro[1][1], "X")
end

function testeJogadaInvalida()
	local tabuleiro = tabuleiroR:instanciar()
	local jogador = jogadorR:instanciar()
	tabuleiro:jogada(1, 1, jogador)
	luaunit.assertEquals(tabuleiro:jogada(1, 1, jogador), false)
end

function testeNaoTerminouOhJogo()
	local tabuleiro = tabuleiroR:instanciar()
	luaunit.assertEquals(tabuleiro:terminou(), false)
end

function testeTerminouOhJogo()
	local tabuleiro = tabuleiroR:instanciar()
	local jogador = jogadorR:instanciar()
	for i = 1, 3 do
		for i2 = 1, 3 do
			tabuleiro:jogada(i, i2, jogador)
		end
	end
	luaunit.assertEquals(tabuleiro:terminou(), true)
end

os.exit(luaunit.LuaUnit.run())