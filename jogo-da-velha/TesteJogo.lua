luaunit = require('luaunit')
jogo = require("jogo")

function testeAlternarJogadorX()
	jogo.jogadorAtual.simbolo = "X"
	jogo:alternarJogador()
	luaunit.assertEquals(jogo.jogadorAtual.simbolo, "O")
end

function testeAlternarJogadorO()
	jogo.jogadorAtual.simbolo = "O"
	jogo:alternarJogador()
	luaunit.assertEquals(jogo.jogadorAtual.simbolo, "X")
end

os.exit(luaunit.LuaUnit.run())