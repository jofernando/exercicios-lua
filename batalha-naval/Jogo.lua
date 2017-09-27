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

function jogo:jogar()
	for k,v in pairs(self) do
		self.jogador1.tabuleiro = tabuleiro:instanciar()
		self.jogador2.tabuleiro = tabuleiro:instanciar()
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
				self.jogador1.tabuleiro:toString()
				self.jogador2.tabuleiro:toString()
				i = i * 2
			else
				print()
				print("Jogada inválida, tente novamento")
				print()
			end
		end
		print("Limpar tela?\n1=sim\n2=não")
		if io.read("*number") == 1 then
			os.execute("cls")
		end
	end
end

joguinho = jogo:instanciar("Mario", "Don")
joguinho:jogar()
--[[
	while true do
		if cont == 1 then
			local ship = navio:instanciar(1,1)
			print("Posicionar um navio 1x1")
			print("=======================")
			print("Escolha a linha")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador1.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador1.tabuleiro:toString()
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		elseif cont == 2 then
			local ship = navio:instanciar(2,1)
			print("Posicionar um navio 2x1")
			print("=======================")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador1.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador1.tabuleiro:toString()
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		elseif cont == 3 then
			local ship = navio:instanciar(4,1)
			print("Posicionar um navio 4x1")
			print("=======================")
			print("Escolha a linha")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador1.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador1.tabuleiro:toString()
				break;
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		end
	end

	while true do
		if cont == 1 then
			local ship = navio:instanciar(1,1)
			print("Posicionar um navio 1x1")
			print("=======================")
			print("Escolha a linha")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador2.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador2.tabuleiro:toString()
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		elseif cont == 2 then
			local ship = navio:instanciar(2,1)
			print("Posicionar um navio 2x1")
			print("=======================")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador2.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador2.tabuleiro:toString()
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		elseif cont == 3 then
			local ship = navio:instanciar(4,1)
			print("Posicionar um navio 4x1")
			print("=======================")
			print("Escolha a linha")
			local linha = io.read("*number")
			print("Escolha a coluna")
			local coluna = io.read("*number")
			print("Escolha a direção. Opções:\ncima = 1\nbaixo = 2\nesquerda = 3\ndireita = 4")
			local direcao = io.read("*number")
			if self.jogador2.tabuleiro:posicionarNavio(ship, linha, coluna, direcao) then
				cont = cont + 1
				self.jogador2.tabuleiro:toString()
				break;
			else
				print()
				print("Jogada inválida tente novamento")
				print()
			end
		end
	end
end]]