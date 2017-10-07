tabuleiro = {}
function tabuleiro:instanciar()
	local novo = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}}
	setmetatable(novo, {__index = tabuleiro})
	for i=1,10 do
		for i2=1,10 do
			novo[i][i2] = "~"
		end
	end
	return novo
end

function tabuleiro:toString()
	str = "   1 2 3 4 5 6 7 8 9 10 \n"
	for i=1,10 do
		if i < 10 then 
			str = str .. " "
		end
		str = str .. i
		for i2=1,10 do
			str = str.." ".. self[i][i2]
		end
		str = str .. "\n"
	end
	print(str)
end

function tabuleiro:posicionarNavio(navio, linha, coluna, direcao)
	if --[[self:verificaLinhaColuna(linha, coluna) and]] self:verificaPosicaoValidaParaPosicionarNavio(navio, linha, coluna, direcao) then
		if (direcao == 1) and (linha - navio.comprimento + 1 >= 1) then
			for i=1, navio.comprimento do
				self[linha+1-i][coluna] = "X"
			end
			return true
		elseif (direcao == 2) and (linha + navio.comprimento - 1 <= 10) then
			for i=1, navio.comprimento do
				self[linha-1+i][coluna] = "X"
			end
			return true
		elseif (direcao == 3) and (coluna - navio.comprimento + 1 >= 1) then
			for i=1, navio.comprimento do
				self[linha][coluna+1-i] = "X"
			end
			return true
		elseif (direcao == 4) and (coluna + navio.comprimento - 1 <= 10) then
			for i=1, navio.comprimento do
				self[linha][coluna-1+i] = "X"
			end
			return true
		end
	end
	return false
end
--[[
function tabuleiro:verificaLinhaColuna(linha, coluna)
	if (linha >= 1 and linha <= 10) and (coluna >= 1 and coluna <= 10) then
		return true
	end
	return false
end]]

function tabuleiro:verificaPosicaoValidaParaPosicionarNavio(navio, linha, coluna, direcao)
	for i=1, navio.comprimento do
		if (direcao == 1 and linha - i + 1 < 1) or (direcao == 1 and self[linha + 1 - i][coluna] ~= "~") then
			return false
		elseif(direcao == 2 and linha + i - 1 > 10) or (direcao == 2 and self[linha - 1 + i][coluna] ~= "~") then
			return false
		elseif (direcao == 3 and coluna - i + 1 < 1) or (direcao == 3 and self[linha][coluna + 1 - i] ~= "~") then
			return false
		elseif (direcao == 4 and coluna + i - 1 > 10) or (direcao == 4 and self[linha][coluna - 1 + i] ~= "~") then
			return false
		end
	end
	return true
end

return tabuleiro