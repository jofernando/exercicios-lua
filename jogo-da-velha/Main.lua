require("Jogo")
require("Tabuleiro")

local jogo = jogo:instanciar()
while true do
	jogo.tabuleiro = tabuleiro:instanciar()
	jogo:jogar()
	print("Jogar novamente?\n1=sim\n2-não")
	a = pedirNumero(1,2)
	if a == 2 then
		break
	end
end
--[[
function pedirNumero(min, max)
	while true do
		numero = io.read()
		numero = tonumber(numero)
		if numero ~= nil and (numero >= min and numero <= max) then
			return numero
		else
			print("Número inávalido, digite novamente")
		end
	end
end
]]
