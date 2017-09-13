v = require("tabuleiro")
j = require("jogador")

jogo = {tabuleiro = v:instanciar(), jogador1 = j:instanciar(), jogador2 = j:instanciar(), jogadorAtual = j:instanciar()}
jogo.jogador1.simbolo = "O"
jogo.jogador2.simbolo = "X"
jogo.jogadorAtual.simbolo = "O"

function jogo:instanciar()
	local novo = {}
	setmetatable(novo, {__index = jogo})
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
	--local cont = true
	while true do
		print("Vez do jogador " .. self.jogadorAtual.simbolo)
		print("Linha")
		local l = io.read("*number")
		print("Coluna")
		local c = io.read("*number")
		print()
		if self.tabuleiro:jogada(l, c, self.jogadorAtual) then
			print(self.tabuleiro:toString())
			print()
			if self.tabuleiro:ganhou() == true then
				print(self.jogadorAtual.simbolo .. " venceu")
				print()
				print(self.tabuleiro:toString())
				break
			end
			if self.tabuleiro:terminou() then
				if self.tabuleiro:ganhou() ~= false then
					print("Empate")
					print()
					print(self.tabuleiro:toString())
					break
				end
			else
				self:alternarJogador()
			end
		end
end
end

return jogo
