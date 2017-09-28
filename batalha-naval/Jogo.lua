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
		
		print(self[k].tabuleiro[1][1])
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
		print("Limpar tela?\n1=sim\n2=não")
		if io.read("*number") == 1 then
			os.execute("cls")
		end
	end
end