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
		if (direcao == 1) and (linha - navio.comprimento >= 1) then
			for i=1, navio.comprimento do
				self[linha-1+i][coluna] = "X"
			end
			return true
		elseif (direcao == 2) and (linha + navio.comprimento <= 10) then
			for i=1, navio.comprimento do
				self[linha+1-i][coluna] = "X"
			end
			return true
		elseif (direcao == 3) and (coluna - navio.comprimento >= 0) then
			for i=1, navio.comprimento do
				self[linha][coluna+1-i] = "X"
			end
			return true
		elseif (direcao == 4) and (coluna + navio.comprimento <= 10) then
			for i=1, navio.comprimento do
				self[linha][coluna-1+i] = "X"
			end
			return true
		end
	end
	return false
end

return tabuleiro