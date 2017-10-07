jogador = {simbolo, pontuacao}
function jogador:instanciar(simbolo)
	local novo = {}
	setmetatable(novo, {__index = jogador})
	if simbolo ~= nil then
		novo.simbolo = simbolo
		novo.pontuacao = 0
	end
	return novo
end

return jogador
