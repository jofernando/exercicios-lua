navio = {altura, largura}
function navio:instanciar(larg, alt)
	local novo = {}
	setmetatable(novo, {__index = navio})
	novo.largura = larg
	novo.altura = alt
	return novo
end