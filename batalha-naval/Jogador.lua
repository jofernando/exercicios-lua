require("Tabuleiro")
jogador = {tabuleiro, navios, nome}
function jogador:instanciar(nome)
	local novo = {}
	setmetatable(novo, {__index = jogador})
	novo.tabuleiro = tabuleiro:instanciar()
	novo.nome = nome
	novo.navios = {{},{},{},{},{},{},{}}
	return novo
end

function jogador:pegarNavios()
	local cont = 1
	for i=1,10 do
		for i2=1,10 do
			if self.tabuleiro[i][i2] == "X" then
				self.navios[cont] = {i, i2}
				cont = cont + 1
			end
		end
	end
end

function jogador:mostrarPosicaoNavios()
	for i,v in ipairs(self.navios) do
		print(self.navios[i][1] .. "," .. self.navios[i][2])
	end
end

function jogador:atirar(linha, coluna)
	for i,v in ipairs(self.navios) do
		if self.navios[i][1] == linha and self.navios[i][2] == coluna then
			self.navios[i][1] = ""
			self.navios[i][2] = ""
			return true
		end
	end
	return false
end

return jogador