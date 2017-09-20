--Crie uma função que calcule todos os inteiros que são divididos pelo número. Por exemplo: print(dividers(4)) = 1, 2, e 4
print("Informe o numero")
a = io.read("*number")


function dividers (num)
	s = ""
	for i = 1, num - 1 do
		if num % i == 0 then
			s = s .. i .. ", "
		end
	end
	s = s .. num
	return s
end

print(dividers(a))
