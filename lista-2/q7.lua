--Crie uma fun��o que recebe uma lista de n�meros inteiros e exiba apenas o n�meros �mpares. OBS: Para representar uma lista de n�meros deve-se se usar tabelas. Por exemplo: print(odds({1,7,2,3,0,6})) = 1, 7, 3.
print("Quantos numeros ira digitar")
a = io.read("*number")
tabela = {}
for i = 1, a do
	num = io.read("*number")
	table.insert(tabela, num)
end


function odds(tabel)
	s = ""
	for j = 1, #tabel do
		if tabel[j] % 2 == 1 then
		s = s .. tabel[j] .. ", "
		end
	end
	return s
end

print(odds(tabela))
