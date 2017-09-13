luaunit = require('luaunit')
jogoR = require("jogo")

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

os.exit(luaunit.LuaUnit.run())