luaunit = require("luaunit")
require("Navio")
require("Jogo")
require("Jogador")
require("Tabuleiro")

--Testes de tabuleiro
--=============================================================================================
function testeInstanciarTabuleiro()
	local tabuleiro = tabuleiro:instanciar()
	for i,v in ipairs(tabuleiro) do
		for i2,v2 in ipairs(v) do
			luaunit.assertEquals(v2, "~")
		end
	end
end

function testeVerificarPosicaoJaMarcada()
	local tabuleiro = tabuleiro:instanciar()
	tabuleiro[1][1] = "X"
	luaunit.assertFalse(
		tabuleiro:verificaPosicaoValidaParaPosicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
end

function testeVerificarPosicaoNaoMarcada()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertTrue(
		tabuleiro:verificaPosicaoValidaParaPosicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
end

function testeVerificarPosicaoValidaParaPosicionarNavio()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertTrue(
		tabuleiro:posicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
	luaunit.assertEquals(tabuleiro[1][1], "X")
end

function testeVerificarPosicaoInvalidaParaPosicionarNavio()
	local tabuleiro = tabuleiro:instanciar()
	tabuleiro[1][1] = "X"
	luaunit.assertFalse(
		tabuleiro:posicionarNavio(
			navio:instanciar(4,1), 1, 1, 2))
end

function testeVerificarVenceu()
	local jogo = jogo:instanciar("Mario", "Don")
	for i,v in ipairs(jogo.jogador1.posicaoNavios) do
		v = {"",""}
	end
	luaunit.assertTrue(jogo:venceu(jogo.jogador1))
end

function testeVerificarNaoVenceu()
	local jogo = jogo:instanciar("Mario", "Don")
	jogo.jogador1.posicaoNavios[1][1] = 1
	jogo.jogador1.posicaoNavios[1][2] = 1
	jogo.jogador2.posicaoNavios[1][1] = 1
	jogo.jogador2.posicaoNavios[1][2] = 1
	luaunit.assertFalse(jogo:venceu(jogo.jogador1))
end

--Testes de Navio
--=============================================================================================
function testeInstanciarNavio()
	local navio = navio:instanciar(2, 1)
	luaunit.assertEquals(navio.largura, 1)
	luaunit.assertEquals(navio.comprimento, 2)
end

--Testes de jogador
--=============================================================================================
function testePegarPosicaoNavios( ... )
	local jogador = jogador:instanciar()
	jogador.tabuleiro:posicionarNavio(navio:instanciar(1,1), 1, 1, 1)
	jogador.tabuleiro:posicionarNavio(navio:instanciar(2,1), 2, 1, 2)
	jogador.tabuleiro:posicionarNavio(navio:instanciar(4,1), 4, 1, 2)
	jogador:pegarNavios()
	posicoes = {{1,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1}}
	luaunit.assertEquals(posicoes, jogador.posicaoNavios)
end

function testeVerificarPerdeu( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		for i2,v2 in ipairs(v) do
			v2 = ""
		end
	end
	luaunit.assertTrue(jogador:perdeu())
end

function testeVerificarNaoPerdeu( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		v = {"",""}
	end
	jogador.posicaoNavios[3] = {2,2}
	luaunit.assertFalse(jogador:perdeu())
end

function testeAtirar( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		v[1] = i
		v[2] = i+1
	end
	luaunit.assertTrue(jogador:atirar(1,2))
end

function testeNaviosEmJogo( ... )
	local jogo = jogo:instanciar()
	for i=1,7 do
		jogo.jogador1.posicaoNavios[i][1] = 1
		jogo.jogador1.posicaoNavios[i][2] = 1
		luaunit.assertEquals(i, jogo.jogador1:naviosEmJogo())
	end
	luaunit.assertEquals(7, jogo.jogador1:naviosEmJogo())
end

os.exit(luaunit.LuaUnit.run())