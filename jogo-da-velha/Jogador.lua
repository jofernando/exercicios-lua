jogador = {simbolo}
function jogador:instanciar()
	local novo = {}
	setmetatable(novo, {__index = jogador})
	return novo
end

return jogador