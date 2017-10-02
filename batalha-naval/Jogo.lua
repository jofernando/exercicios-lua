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
			local ship = navio:instanciar(i,1)
			print("Posicione um navio "..i.."x1")
			print("Escolha a linha")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")

			if self[k].tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				self[k].tabuleiro:toString()
				i = i * 2
			else
				print()
				print("Jogada inválida, tente novamento")
				print()
			end
		end
		self[k]:pegarNavios()
		--[[print("Limpar tela?\n1=sim\n2=não")
		if io.read("*number") == 1 then
			os.execute("cls")
		end]]
	end
end

function jogo:alternarJogadores()
	local cont = math.random(3)
	while true do
		local jogadorAtual = self["jogador" .. cont % 2 + 1]
		print(jogadorAtual.nome.." faça sua jogada")
		print("Escolha a linha")
		local linha = io.read("*number")
		print("Escolha a coluna")
		local coluna = io.read("*number")
		if self["jogador" .. (cont + 1) % 2 + 1]:atirar(linha, coluna) == false then
			cont = cont + 1
		end
		if self.jogador1:perdeu() or self.jogador2:perdeu() then
			break
		end
		self.jogador1:mostrarPosicoes()
		self.jogador2:mostrarPosicoes()
	end
end

function jogo:teste( ... )
	local cont = math.random(3)
	print(cont)
	print(cont % 2 + 1)
	print((cont+1) % 2 + 1)	
end