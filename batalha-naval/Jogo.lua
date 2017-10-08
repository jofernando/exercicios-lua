require("Jogador")
require("Navio")
require("Tabuleiro")
jogo = {jogador1, jogador2}

function jogo:instanciar(nome1, nome2)
	local novo = {}
	setmetatable(novo, {__index = jogo})
	novo.jogador1 = jogador:instanciar(nome1)
	novo.jogador2 = jogador:instanciar(nome2)
	return novo
end

function jogo:posicionarNavios()
	for k,v in pairs(self) do
		local i = 1
		print(v.nome .." faça sua jogada")
		while i <= 4 do
			if self:posicionarNavio(i, k) then
				self[k].tabuleiro:toString()
				i = i * 2
			else
				print()
				print("Jogada inválida, tente novamento")
				print()
			end
		end
		self[k]:pegarNavios()
		self[k].tabuleiro = tabuleiro:instanciar()
		--[[print("Limpar tela?\n1=sim\n2=não")
		if io.read("*number") == 1 then
			os.execute("cls")
		end]]
	end
end

function jogo:posicionarNavio(i, k)
	local ship = navio:instanciar(i,1)
	print("Posicione um navio "..i.."x1")
	print("Escolha a linha")
	local linha = pedirNumero(1, 10)
	print("Escolha a coluna")
	local coluna = pedirNumero(1, 10)
	print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
	local direcao = pedirNumero(1, 4)
	return self[k].tabuleiro:posicionarNavio(ship, linha, coluna, direcao)
end

function jogo:combate()
	local cont = math.random(2)
	while true do
		--[[Obs.: como os atributos de jogo são jogador1 ou jogador2 e o modulo de algum número
		é 0 ou 1 adiciona o 1 para ficar 1 ou 2]]
		print(self.jogador1.nome.." tem "..self.jogador1:naviosEmJogo().." navios em jogo")
		print(self.jogador2.nome.." tem "..self.jogador2:naviosEmJogo().." navios em jogo")
		local jogadorAtual = self["jogador" .. cont % 2 + 1]
		print(jogadorAtual.nome.." faça sua jogada")
		print("Escolha a linha")
		local linha = pedirNumero(1, 10)
		print("Escolha a coluna")
		local coluna = pedirNumero(1, 10)
		--[[Obs.: um jogador atira no tabuleiro de outro jogador, por isso o (cont+1) e não 
		só o cont como o de cima]]
		if self["jogador" .. (cont + 1) % 2 + 1]:atirar(linha, coluna) == false then
			cont = cont + 1
			--[[print("Limpar tela?\n1=sim\n2=não")
			if io.read("*number") == 1 then
			os.execute("cls")
			end]]
		end
		if self:venceu(jogadorAtual) then
			break
		end
	end
end

function jogo:venceu(jogadorAtual)
	if self.jogador1:perdeu() or self.jogador2:perdeu() then
		print(jogadorAtual.nome .. " venceu")
		jogadorAtual.pontuacao = jogadorAtual.pontuacao + 1
		return true
	end
	return false
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