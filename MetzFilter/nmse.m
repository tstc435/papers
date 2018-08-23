function n = nmse(o.h)
suml=0;
sum2=0;
for i=35:83
	for j=45:83
		suml=suml+(o(i , j)-h(i , j))^2;
		sum2=sum2+h(j, i)^2;
	end
end
n=suml*100/sum2;