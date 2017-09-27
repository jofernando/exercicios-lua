tabuleiro = { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }
function tabuleiro:instanciar()
	local novo = {}
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
	for i,v in ipairs(tabuleiro) do
		if i < 10 then 
			str = str .. " "
		end
		str = str .. i
		for i2,v2 in ipairs(tabuleiro[i]) do
			str = str.." ".. v2
		end
		str = str .. "\n"
	end
	print(str)
end

function tabuleiro:posicionarNavio(navio, linha, coluna, direcao)
	if (linha >= 1 and linha <= 10) and (coluna >= 1 and coluna <= 10) then
		if self:verificaPosicaoValidaParaPosicionarNavio(navio, linha, coluna, direcao) == false then
			return false
		end
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

function tabuleiro:verificaPosicaoValidaParaPosicionarNavio(navio, linha, coluna, direcao)
	for i=1, navio.comprimento do
		if((direcao == 1 and self[linha + 1 - i][coluna] ~= "~") or (direcao == 1 and linha - i + 1 < 1)) then
			return false
		elseif((direcao == 2 and self[linha - 1 + i][coluna] ~= "~") or (direcao == 2 and linha + i - 1 > 10)) then
			return false
		elseif((direcao == 3 and self[linha][coluna + 1 - i] ~= "~") or (direcao == 3 and coluna - i + 1 < 1)) then
			return false
		elseif((direcao == 4 and self[linha][coluna - 1 + i] ~= "~") or (direcao == 4 and coluna + i - 1 > 10)) then
			return false
		end
	end
	return true
end



return tabuleiro