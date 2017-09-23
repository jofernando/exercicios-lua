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

function tabuleiro:jogada(linha, coluna, jogador)
	if (linha >= 1 and linha <= 10) and (coluna >= 1 and coluna <=10) and (self[linha][coluna] == "~") then
		self[linha][coluna] = jogador.simbolo
		return true
	end
	return false
end

tab = tabuleiro:instanciar()
tab:toString()
return tabuleiro
