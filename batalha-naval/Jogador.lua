require("Tabuleiro")
jogador = {tabuleiro , posicaoNavios, nome, pontuacao}
function jogador:instanciar(nome)
	local novo = {}
	setmetatable(novo, {__index = jogador})
	novo.tabuleiro = tabuleiro:instanciar()
	novo.nome = nome
	novo.posicaoNavios = {{},{},{},{},{},{},{}}
	novo.pontuacao = 0
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

function jogador:atirar(linha, coluna)
	if self.tabuleiro[linha][coluna] == "O" then
		print("Navio nessa posição já foi afundado, jogue novamente")
		return true
	end
	for i,v in ipairs(self.posicaoNavios) do
		if v[1] == linha and v[2] == coluna and self.tabuleiro[linha][coluna] == "~" then
			self.tabuleiro[linha][coluna] = "O"
			self.posicaoNavios[i][1] = ""
			self.posicaoNavios[i][2] = ""
			self.tabuleiro:toString()
			print("Acertou")
			return true
		end
	end
	self.tabuleiro[linha][coluna] = "X"
	self.tabuleiro:toString()
	print("Errou")
	return false
end

function jogador:perdeu()
	for i,v in ipairs(self.posicaoNavios) do
		for i2,v2 in ipairs(v) do
			if v2 ~= "" then
				return false
			end
		end
	end
	return true
end

function jogador:naviosEmJogo()
	local cont = 0
	for i,v in ipairs(self.posicaoNavios) do
		for i2,v2 in ipairs(v) do
			if v2 ~= "" then
				cont = cont +1
			end
		end
	end
	return cont/2
end

return jogador