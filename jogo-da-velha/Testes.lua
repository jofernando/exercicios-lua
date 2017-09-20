luaunit = require("luaunit")
tabuleiroR = require("Tabuleiro")
jogadorR = require("Jogador")
jogadorR.simbolo = "X"
jogoR = require("Jogo")

function testeAlternarJogadorX()
	local jogo = jogoR:instanciar()
	jogo.jogadorAtual.simbolo = "X"
	jogo:alternarJogador()
	luaunit.assertEquals(jogo.jogadorAtual.simbolo, "O")
end

function testeAlternarJogadorO()
	local jogo = jogoR:instanciar()
	jogo.jogadorAtual.simbolo = "O"
	jogo:alternarJogador()
	luaunit.assertEquals(jogo.jogadorAtual.simbolo, "X")
end

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

function testeVenceuOhJogoLinha()
	local jogador = jogadorR:instanciar()
	for i=1,3 do
	  local tabuleiro = tabuleiroR:instanciar()
	  tabuleiro:jogada(i, 1, jogador)
	  tabuleiro:jogada(i, 2, jogador)
	  tabuleiro:jogada(i, 3, jogador)
	  luaunit.assertEquals(tabuleiro:ganhou(), true)
	end
end

function testeVenceuOhJogoColuna()
	local jogador = jogadorR:instanciar()
	for i=1,3 do
	  local tabuleiro = tabuleiroR:instanciar()
	  tabuleiro:jogada(1, i, jogador)
	  tabuleiro:jogada(2, i, jogador)
	  tabuleiro:jogada(3, i, jogador)
	  luaunit.assertEquals(tabuleiro:ganhou(), true)
	end
end

function testeNinguemVenceu()
    local tabuleiro = tabuleiroR:instanciar()
    luaunit.assertEquals(tabuleiro:ganhou(), false)
end

os.exit(luaunit.LuaUnit.run())
