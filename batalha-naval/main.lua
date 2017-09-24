require("Navio")
require("Tabuleiro")

tab = tabuleiro:instanciar()
cont = 1
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
		if tab:posicionarNavio(ship, linha, coluna, direcao) then
			cont = cont + 1
			tab:toString()
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
		if tab:posicionarNavio(ship, linha, coluna, direcao) then
			cont = cont + 1
			tab:toString()
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
		if tab:posicionarNavio(ship, linha, coluna, direcao) then
			cont = cont + 1
			tab:toString()
		else
			print()
			print("Jogada inválida tente novamento")
			print()
		end
	end
end