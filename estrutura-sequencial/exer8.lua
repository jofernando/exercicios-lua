--Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês.
--Calcule e mostre o total do seu salário no referido mês
print("Informe o quanto voce ganha por hora")
porHora = io.read("*number")
print("Informe o numero de horas trabalhadas por mes")
horasMes = io.read("*number")
print("Salario: "..porHora * horasMes)