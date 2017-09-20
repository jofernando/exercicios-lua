--[[Faça um Programa que peça 2 números inteiros e um número real. Calcule e mostre:
o produto do dobro do primeiro com metade do segundo .
a soma do triplo do primeiro com o terceiro.
o terceiro elevado ao cubo.]]
print("Informe tres numeros")
a, b, c = io.read("*number"), io.read("*number"), io.read("*number")
print((a * 2) * (b / 2))
print((a * 3) + c)
print(c * c * c)