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

function jogador:mostrarPosicoes( ... )
	for i,v in ipairs(self.posicaoNavios) do
		print(v[1]..","..v[2])
	end
end

function jogador:atirar(linha, coluna)
	if self:verificaLinhaColuna(linha, coluna) then
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
	end
	self.tabuleiro[linha][coluna] = "X"
	self.tabuleiro:toString()
	print("Errou")
	return false
end

function jogador:perdeu()
	for i,v in ipairs(self.posicaoNavios) do
		if self.posicaoNavios[i][1] ~= "" or self.posicaoNavios[i][2] ~= "" then
			return false
		end
	end
	return true
end

function jogador:verificaLinhaColuna(linha, coluna)
	if (linha >= 1 and linha <= 10) and (coluna >= 1 and coluna <= 10) then
		return true
	end
	return false
end

return jogador