tabuleiroR = require("Tabuleiro")
jogadorR = require("Jogador")

jogo = {tabuleiro, jogador1, jogador2, jogadorAtual}

function jogo:instanciar()
	local novo = {}
	setmetatable(novo, {__index = jogo})
	novo.tabuleiro = tabuleiroR:instanciar()
	novo.jogador1 = jogadorR:instanciar("O")
	novo.jogador2 = jogadorR:instanciar("X")
	novo.jogadorAtual = novo.jogador1
	return novo
end

function jogo:alternarJogador()
	if self.jogador1.simbolo == self.jogadorAtual.simbolo then
		self.jogadorAtual = self.jogador2
	else
		self.jogadorAtual = self.jogador1
	end
end

--[[
function jogo:vencedor()
	if self.tabuleiro:ganhou() then
		print(self.jogadorAtual.simbolo, "venceu")
		print()
		print(self.tabuleiro:toString())
		return true
	elseif self.tabuleiro:terminou() then
		if self.tabuleiro:ganhou() ~= false then
			print("Empate")
			print()
			print(self.tabuleiro:toString())
			return true
		end
	else
		print("Empate")
		print()
		print(self.tabuleiro:toString())
	end
end
]]

function jogo:jogar()
	while true do
		print("Vez do jogador " .. self.jogadorAtual.simbolo)
		print("Linha")
		local l = pedirNumero(1, 3)
		print("Coluna")
		local c = pedirNumero(1, 3)
		print()
		if self.tabuleiro:jogada(l, c, self.jogadorAtual) then
			print(self.tabuleiro:toString())
			print()
			if self.tabuleiro:ganhou() == true then
				self.jogadorAtual.pontuacao = self.jogadorAtual.pontuacao + 1
				print(self.jogadorAtual.simbolo .. " venceu, " .. self.jogadorAtual.pontuacao .. " pontos")
				print()
				print(self.tabuleiro:toString())
				break
	      	elseif self.tabuleiro:terminou() then
				print("Empate")
				print()
				print(self.tabuleiro:toString())
				break
			else
				self:alternarJogador()
			end
		else
			print("A linha ".. l .." com a coluna ".. c .." não é uma posição válida, informe uma posição válida")
		end
	end
end

function pedirNumero(min, max)
	while true do
		numero = io.read()
		numero = tonumber(numero)
		if numero ~= nil and (numero >= min and numero <= max) then
			return numero
		else
			print("Número inávalido, digite novamente")
		end
	end
end

return jogo
