--[[Escreva um programa em Lua que calcule e imprima a média ponderada de um aluno.
Inicialmente, o programa deverá ler o peso da primeira prova e o peso da segunda prova.
A seguir, o programa deverá ler os seguintes dados do aluno: matrícula, nota da primeira
prova e nota da segunda prova (ambas reais). Por ultimo, o programa deve mostrar a
matricula do aluno seguida da sua média. O seu programa deve, obrigatoriamente, utilizar
a seguinte função feita por você:
 função calcula_media_ponderada(): recebe 2 notas (reais) e seus respectivos
pesos (inteiros) como parâmetros e retorna a média ponderada dos valores.]]
function calcula_media_ponderada(n1, n2, p1, p2)
	return (n1 + n2) / (p1 + p2)
end
print("Informe sua matricula")
mat = io.read("*line")
print("Informe o peso da primeira prova")
p1 = io.read("*number")
print("Informe o peso da segunda prova")
p2 = io.read("*number")
print("Informe a nota da primeira prova")
n1 = io.read("*number")
print("Informe a nota da segunda prova")
n2 = io.read("*number")
print(mat .. ": "..calcula_media_ponderada(n1, n2, p1, p2))
