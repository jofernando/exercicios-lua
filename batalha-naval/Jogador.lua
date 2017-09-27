require("Tabuleiro")
jogador = {tabuleiro , posicaoNavios, nome}
function jogador:instanciar(nome)
	local novo = {}
	setmetatable(novo, {__index = jogador})
	novo.tabuleiro = tabuleiro:instanciar()
	novo.nome = nome
	novo.posicaoNavios = {{},{},{},{},{},{},{}}
	return novo
end

function jogador:pegarNavios()
	local index = 1
	for i=1,10 do
		for i2=1,10 do
			if self.tabuleiro[i][i2] == "X" then
				self.posicaoNavios[index] = {i, i2}
				index = index + 1
			end
		end
	end
end

function jogador:mostrarPosicaoNavios()
	for i,v in ipairs(self.posicaoNavios) do
		print(self.posicaoNavios[i][1] .. "," .. self.posicaoNavios[i][2])
	end
end

function jogador:atirar(linha, coluna)
	for i,v in ipairs(self.posicaoNavios) do
		if self.posicaoNavios[i][1] == linha and self.posicaoNavios[i][2] == coluna then
			self.posicaoNavios[i][1] = ""
			self.posicaoNavios[i][2] = ""
			return true
		end
	end
	return false
end

function jogador:perdeu()
	for i,v in ipairs(self) do
		if v ~= "" then
			return false
		end
	end
	return true
end

return jogador