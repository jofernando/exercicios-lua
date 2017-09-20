--[[Implemente em Lua um programa que receba do usuário o valor do salário bruto de um
funcionário e imprima o valor com descontos de INSS, FGTS e Plano de Saúde. O programa
deve utilizar uma função para calcular cada um dos descontos, sendo que estas funções
devem receber o valor do salário bruto e retornar o valor a ser descontado. Os valores
descontados devem ser:
 INSS: 10% do valor bruto
 FGTS: 8%
 Plano de Saúde: R$100,00]]
function inss(porcentagem, salarioBruto)
	return (salarioBruto/100)*porcentagem
end
function fgts(porcentagem, salarioBruto)
	return (salarioBruto/100)*porcentagem
end
print("Informe o salario bruto")
salarioBruto = io.read("*number")
print(salarioBruto - 100 - inss(10, salarioBruto) - fgts(8, salarioBruto))