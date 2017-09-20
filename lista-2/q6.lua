--Crie uma função que calcula os 50 primeiros números primos. Por exemplo: primesUntil50() = 1, 2, 3, 5, ..., 47

function primesUntil50()
	s = ""
	aux = 0
	for i = 1, 100000 do
		if(ehPrimo(i) == true) then
			s = s .. i .. " "
			aux = aux + 1
			if aux == 50 then
				return s
			end
		end
	end
end

function ehPrimo(n)
	count = 0
	for j =1, n do
		if n % j == 0 then
			count = count + 1
		end
	end
	if count == 2 then
		return true
	else
		return false
	end
end

print(primesUntil50())
