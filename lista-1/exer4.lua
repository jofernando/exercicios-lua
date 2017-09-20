--[[Escreva um programa em Lua que leia 2 números inteiros, calcule e exiba a média
aritmética e o produto dos números. O seu programa deve, obrigatoriamente, utilizar as
seguintes funções feitas por você:
 função calcula_media(): recebe 2 números como parâmetros e retorne a
média dos números;
 função calcula_produto(): recebe 2 números como parâmetros e retorna o
produto dos números.]]
function calcula_media(a, b)
	return (a +b) / 2
end

function calcula_produto( ... )
	return a * b
end

print(calcula_media(1,4))