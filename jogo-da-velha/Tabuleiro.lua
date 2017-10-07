tabuleiro = { {}, {}, {} }
function tabuleiro:instanciar()
	local novo = {}
	setmetatable(novo, {__index = tabuleiro})
	for i=1,3 do
		for i2=1,3 do
			novo[i][i2] = " "
		end
	end
	return novo
end

function tabuleiro:jogada(linha, coluna, jogador)
	if --[[(linha >= 1 and linha <= 3) and (coluna >= 1 and coluna <=3) and]] (self[linha][coluna] == " ") then
		self[linha][coluna] = jogador.simbolo
		return true
	else
		return false
	end
end

function tabuleiro:terminou()
	for i = 1, 3 do
		for i2 = 1, 3 do
			if self[i][i2] == " " then
				return false
			end
		end
	end
	return true
end

function tabuleiro:ganhou()
	for i = 1, 3 do
		if ((self[i][1] == self[i][2]) and (self[i][2] == self[i][3])) and (self[i][1] ~= " ") then
			self[i][1] = "-"
			self[i][2] = "-"
			self[i][3] = "-"
			return true
		end
	end

	for i = 1, 3 do
		if ((self[1][i] == self[2][i]) and (self[2][i] == self[3][i])) and (self[1][i] ~= " ") then
			self[1][i] = "|"
			self[2][i] = "|"
			self[3][i] = "|"
			return true
		end
	end

	if (self[1][1] == self[2][2]) and (self[2][2] == self[3][3]) and (self[2][2] ~= " ") then
		self[1][1] = "\\"
		self[2][2] = "\\"
		self[3][3] = "\\"
		return true
	end
	if (self[1][3] == self[2][2]) and (self[2][2] == self[3][1]) and (self[2][2] ~= " ") then
		self[1][3] = "/"
		self[2][2] = "/"
		self[3][1] = "/"
		return true
	end
	return false
end

function tabuleiro:toString()
	print(self[1][1] .. "|" .. self[1][2] .. "|" .. self[1][3])
	print("-----")
	print(self[2][1] .. "|" .. self[2][2] .. "|" .. self[2][3])
	print("-----")
	print(self[3][1] .. "|" .. self[3][2] .. "|" .. self[3][3])
end

return tabuleiro