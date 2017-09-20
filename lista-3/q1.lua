--[[Classe porta
Atributos: aberta, cor, dimensaoX, dimensaoY, dimensaoZ
Métodos: void abre(), void fecha(), void pinta(String s), boolean estaAberta()
Para testar, crie uma porta, abra e feche a mesma, pinte-a de diversas cores,
altere suas dimensões e use o método estaAberta para verificar se ela está aberta.]]
porta = {aberta = nil, cor = nil, dimensaoX = nil, dimensaoY = nil, dimensaoZ = nil}
function porta:molde()
	novo = {}
	setmetatable(novo, {__index = porta})
	return novo
end


function porta:abre()
	self.aberta = true
end

function porta:fecha()
	self.aberta = false
end

function porta:pinta(cor)
	self.cor = cor
end

function porta:estaAberta()
	return self.aberta
end

portaGrandona = porta:molde()
portaGrandona:pinta("amarelo")

--[[Classe Casa
Atributos: cor, porta1, porta2, porta3
Método: void pinta(String s), int quantasPortaEstaoAbertas(), int totalDePortas()
Para testar, crie uma casa e pinte-a. Crie três portas e coloque-as na casa; abra e feche as mesmas como desejar. Utilize o método quantasPortasEstaoAbertas para imprimir o número de portas abertas]]

casa = {cor = nil, porta1 = porta:molde(), porta2 = porta:molde(), porta3 = porta:molde()}
function casa:molde()
	novo = {}
	setmetatable(novo, {__index = casa})
	return novo
end

function casa:quantasPortasEstaoAbertas()
	n = 0
	if self.porta1:estaAberta() then
		n = n + 1
	end

	if self.porta2:estaAberta() then
		n = n + 1
	end

	if self.porta3:estaAberta() then
		n = n + 1
	end
	return n
end

casarao = casa:molde()
casarao.cor = "rosa"
casarao.porta1.aberta = true
print(casarao:quantasPortasEstaoAbertas())
