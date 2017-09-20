--Faça um Programa que peça as 4 notas bimestrais e mostre a média
print("Informe as 4 notas")
a, b, c, d = io.read("*number"), io.read("*number"), io.read("*number"), io.read("*number")
print("Media: "..(a + b + c + d) / 4)