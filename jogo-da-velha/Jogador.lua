jogador = {simbolo}
function jogador:instanciar(simbolo)
	local novo = {}
	setmetatable(novo, {__index = jogador})
	if simbolo ~= nil then
		novo.simbolo = simbolo
	end
	return novo
end

return jogador