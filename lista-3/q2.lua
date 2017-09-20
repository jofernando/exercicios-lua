--[[Escreva uma classe que represente um pa�s. Um pa�s tem como atributos: o seu nome, o nome da capital, sua dimens�o em Km2 e uma lista de pa�ses com os quais ele faz fronteira.
Crie os seguintes m�todos:
Crie tamb�m um m�todo que permita verificar se dois pa�ses s�o iguais. Dois pa�ses s�o iguais se tiverem o mesmo nome e a mesma capital.
Um m�todo que receba um outro pa�s como par�metro e retorne uma lista de vizinhos comuns aos dois pa�ses]]
pais = {nome = nil, capital = nil, dimensao = nil, fronteiraPaises = {}}
function pais:molde()
	novo = {}
	setmetatable(novo, {__index = pais})
	return novo
end

function pais:equals(p)
	if self.nome ~= p.nome then
		return false
	end
	if self.capital ~= p.capital then
		return false
	end
	return true
end

function pais:fronteiraIguais(p)
--	i = 1
--	j = 1
	lista = {}
--	while self["fronteiraPaises"][i] ~= nil do
--	 j = 0
--		while p["fronteiraPaises"][j] ~= nil do
--			if self["fronteiraPaises"][i]:equals(p["fronteiraPaises"][j]) then
--				table.insert(lista, p.fronteiraPaises[j])
--				break
--			end
--			j = j + 1
--		end
--		i = i +1
--	end
  for i = 1, #self.fronteiraPaises do
    for j = 1, #p.fronteiraPaises do 
      if self["fronteiraPaises"][i]:equals(p["fronteiraPaises"][j]) then
        table.insert(lista, self.fronteiraPaises.i)
        print(self.fronteiraPaises.i)
      end
    end
  end
	return lista
end

local brasil = pais:molde()
local argentina = pais:molde()
local bolivia = pais:molde()
local peru = pais:molde()
local colombia = pais:molde()
local venezuela = pais:molde()

brasil["capital"] = "Bras�lia"
argentina["capital"] = "Buenos Aires"
bolivia["capital"] = "La Paz"
peru["capital"] = "Lima"
colombia["capital"] = "Bogot�"
venezuela["capital"] = "Caracas"

brasil["dimensao"] = 10000
argentina["dimensao"] = 10000
bolivia["dimensao"] = 10000
peru["dimensao"] = 10000
colombia["dimensao"] = 10000
venezuela["dimensao"] = 10000

table.insert(brasil["fronteiraPaises"],bolivia)
table.insert(brasil["fronteiraPaises"],peru)
table.insert(brasil["fronteiraPaises"],venezuela)
table.insert(brasil["fronteiraPaises"],colombia)

table.insert(argentina["fronteiraPaises"],bolivia)
table.insert(argentina["fronteiraPaises"],peru)
table.insert(argentina["fronteiraPaises"],venezuela)
table.insert(argentina["fronteiraPaises"],colombia)

fronteira = brasil:fronteiraIguais(argentina)
for i = 1, #fronteira do
  print(fronteira[i])
end