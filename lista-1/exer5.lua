--[[Implemente um programa em lua que leia as coordenadas de dois pontos e calcule a
distância entre eles. Lembre-se que a distância entre dois pontos é dada pela seguinte
fórmula:

d = raizQuadrada((x2-x1)^2+(y2-y1)^2)

O seu programa deve, obrigatoriamente, utilizar a seguinte função feita por você:
 função distancia(): recebe quatro números inteiros como parâmetro
representados os pontos, e retorna a distancia entre os pontos.
OBS: para calcular a raiz quadrada de um número utilize a função math.sqrt(x), onde
x deve ser substituído pelo valor que se deseja calcular a raiz quadrada. A função retorna o
a raiz quadrada de x. Para elevar um número a uma potencia utilize o operador ^.
Exemplo: x ^ 2 (eleva x ao quadrado)]]
print("Primeiro ponto")
print("Digite o valor de x")
x1 = io.read("*number")
print("Digite o valor de y")
y1 = io.read("*number")
print("Segundo ponto")
print("Digite o valor de x")
x2 = io.read("*number")
print("Digite o valor de y")
y2 = io.read("*number")
x = (x2-x1)*(x2-x1)
y = (y2-y1)*(y2-y1)
d = math.sqrt(x+y)
print("A distancia dos pontos e: "..d)
