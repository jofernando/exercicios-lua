require("Jogo")
require("Tabuleiro")
print("Digite o nome do jogador")
local nome1 = io.read()
print("Digite o nome do outro jogador")
local nome2 = io.read()

while true do
	
	local jogo = jogo:instanciar(nome1, nome2)
	jogo:posicionarNavios()
	jogo:combate()
	print("Jogar novamente?\n1=sim\n2-não")
	a = pedirNumero(1,2)
	if a == 2 then
		break
	end
end
