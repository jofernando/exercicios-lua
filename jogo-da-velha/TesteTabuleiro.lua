luaunit = require('luaunit')
tabuleiro = require('tabuleiro')
jogador = require('jogador')
jogador.simbolo = "X"

function testeJogadaValida()
	luaunit.assertEquals(tabuleiro:jogada(1, 2, jogador), true)
end

function testeJogadaValidaPosicao()
	tabuleiro:jogada(1, 1, jogador)
	luaunit.assertEquals(tabuleiro[1][1], "X")
end

function testeJogadaInvalida()
	tabuleiro:jogada(1, 1, jogador)
	luaunit.assertEquals(tabuleiro:jogada(1, 1, jogador), false)
end

function testeNaoTerminouOhJogo()
	luaunit.assertEquals(tabuleiro:terminou(), false)
end

function testeTerminouOhJogo()
	for i,v in ipairs(tabuleiro) do
		for i2,v2 in ipairs(tabuleiro[i]) do
			tabuleiro:jogada(i, i2, jogador)
		end
	end
	luaunit.assertEquals(tabuleiro:terminou(), true)
end

os.exit(luaunit.LuaUnit.run())