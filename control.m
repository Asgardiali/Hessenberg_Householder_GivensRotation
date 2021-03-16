function H=control(H)
%Matrisin boyutuna göre for döngüsü yapmak için boyutunu ölçtüm.
say=max(size(H));
%Matris elemanlarý üzerinde gezebilmek için dört adet for döngüsü
%oluþturdum. 
for i=1:1:say
    for j=1:1:say
        for k=1:1:say
            for l=1:1:say
%Ayný indise sahip elemanlarý deðiþim yapmamasý için if ile kontrol ettim.
                if(i==k && j==l)
                    continue;
                else
                    if(H(i,j)==H(k,l))
                        % H matrisinin istenilen özelliklerine göre ayný
                        % elemaný deðiþtirdim.
                        if(mod(i,2)==1 && mod(j,2)==1)
                            H(i,j)=rand(1);
                            continue;
                        elseif(mod(i,2)==0 && mod(j,2)==0)
                            H(i,j)=abs(randn(1));
                            continue;
                        else
                            H(i,j)=1;
                            continue;
                        end
                    end
                end
            end
        end
    end
end