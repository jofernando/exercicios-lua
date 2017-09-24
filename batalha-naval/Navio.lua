navio = {comprimento, largura}
function navio:instanciar(x, y)
	local novo = {}
	setmetatable(novo, {__index = navio})
	novo.comprimento = x
	novo.largura = y
	return novo
end

return navio