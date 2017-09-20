--[[Escreva uma classe que represente um país. Um país tem como atributos: o seu nome, o nome da capital, sua dimensão em Km2 e uma lista de países com os quais ele faz fronteira.
Crie os seguintes métodos:
Crie também um método que permita verificar se dois países são iguais. Dois países são iguais se tiverem o mesmo nome e a mesma capital.
Um método que receba um outro país como parâmetro e retorne uma lista de vizinhos comuns aos dois países]]
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

brasil["capital"] = "Brasília"
argentina["capital"] = "Buenos Aires"
bolivia["capital"] = "La Paz"
peru["capital"] = "Lima"
colombia["capital"] = "Bogotá"
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