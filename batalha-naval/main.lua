require("Jogo")
require("Tabuleiro")

local jogo = jogo:instanciar("Mario", "Don")
for i,v in ipairs(jogo.jogador1.posicaoNavios) do
	v[1] = i
	v[2] = i + 1
end
for i,v in ipairs(jogo.jogador2.posicaoNavios) do
	v[1] = i
	v[2] = i + 1
end
jogo.jogador1:mostrarPosicoes()
jogo.jogador2:mostrarPosicoes()
jogo:alternarJogadores()