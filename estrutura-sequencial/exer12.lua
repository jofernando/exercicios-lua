--[[Tendo como dados de entrada a altura de uma pessoa, construa um algoritmo que calcule seu peso ideal,
 usando a seguinte fórmula: (72.7*altura) - 58]]
 print("Informe sua altura")
 altura = io.read("*number")
 print("Peso ideal: " .. 72.7 * altura - 58)