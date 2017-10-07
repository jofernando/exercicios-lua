luaunit = require("luaunit")
require("Navio")
require("Jogo")
require("Jogador")
require("Tabuleiro")

--Testes de tabuleiro
--=============================================================================================
function testeDeveInstanciarTabuleiro()
	local tabuleiro = tabuleiro:instanciar()
	for i,v in ipairs(tabuleiro) do
		for i2,v2 in ipairs(v) do
			luaunit.assertEquals(v2, "~")
		end
	end
end
--[[
function testeDeveVerificarLinhaColunaCorretoDoTabuleiro()
	local tabuleiro = tabuleiro:instanciar()
	for i=1,10 do
		for i2=1,10 do
			luaunit.assertTrue(tabuleiro:verificaLinhaColuna(i,i2))
		end
	end
end

function testeDeveVerificarLinhaIncorretoDoTabuleiro()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertFalse(tabuleiro:verificaLinhaColuna(-1,2))
end

function testeDeveVerificarColunaIncorretoDoTabuleiro()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertFalse(tabuleiro:verificaLinhaColuna(0,-2))
end]]

function testeDeveVerificarPosicaoJaMarcada()
	local tabuleiro = tabuleiro:instanciar()
	tabuleiro[1][1] = "X"
	luaunit.assertFalse(
		tabuleiro:verificaPosicaoValidaParaPosicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
end

function testeDeveVerificarPosicaoNaoMarcada()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertTrue(
		tabuleiro:verificaPosicaoValidaParaPosicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
end

function testeDeveVerificarPosicaoValidaParaPosicionarNavio()
	local tabuleiro = tabuleiro:instanciar()
	luaunit.assertTrue(
		tabuleiro:posicionarNavio(
			navio:instanciar(1,1), 1, 1, 1))
	luaunit.assertEquals(tabuleiro[1][1], "X")
end

function testeDeveVerificarPosicaoInvalidaParaPosicionarNavio()
	local tabuleiro = tabuleiro:instanciar()
	tabuleiro[1][1] = "X"
	luaunit.assertFalse(
		tabuleiro:posicionarNavio(
			navio:instanciar(4,1), 1, 1, 2))
end

--Testes de Navio
--=============================================================================================
function testeDeveInstanciarNavio()
	local navio = navio:instanciar(2, 1)
	luaunit.assertEquals(navio.largura, 1)
	luaunit.assertEquals(navio.comprimento, 2)
end

--Testes de jogador
--=============================================================================================
function testeDeveSalvarNavios( ... )
	local jogador = jogador:instanciar()
	jogador.tabuleiro:posicionarNavio(navio:instanciar(1,1), 1, 1, 1)
	jogador.tabuleiro:posicionarNavio(navio:instanciar(2,1), 2, 1, 2)
	jogador.tabuleiro:posicionarNavio(navio:instanciar(4,1), 4, 1, 2)
	jogador:pegarNavios()
	posicoes = {{1,1},{2,1},{3,1},{4,1},{5,1},{6,1},{7,1}}
	luaunit.assertEquals(posicoes, jogador.posicaoNavios)
end

function testeDeveVerificarPerdeu( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		for i2,v2 in ipairs(v) do
			v2 = ""
		end
	end
	luaunit.assertTrue(jogador:perdeu())
end

function testeDeveVerificarNaoPerdeu( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		v = {"",""}
	end
	jogador.posicaoNavios[3] = {2,2}
	luaunit.assertFalse(jogador:perdeu())
end

function testeDeveAtirar( ... )
	local jogador = jogador:instanciar()
	for i,v in ipairs(jogador.posicaoNavios) do
		v[1] = i
		v[2] = i+1
	end
	luaunit.assertTrue(jogador:atirar(1,2))
	luaunit.assertFalse(jogador:atirar(1,2))
	luaunit.assertFalse(jogador:atirar(1,1))
end
--[[
function testeDeveVerificarLinhaColunaCorretoDoJogador()
	local jogador = jogador:instanciar()
	for i=1,10 do
		for i2=1,10 do
			luaunit.assertTrue(jogador:verificaLinhaColuna(i,i2))
		end
	end
end

function testeDeveVerificarLinhaIncorretoDoJogador()
	local jogador = jogador:instanciar()
	luaunit.assertFalse(jogador:verificaLinhaColuna(-1,2))
end

function testeDeveVerificarColunaIncorretoDoJogador()
	local jogador = jogador:instanciar()
	luaunit.assertFalse(jogador:verificaLinhaColuna(0,-2))
end
]]


os.exit(luaunit.LuaUnit.run())