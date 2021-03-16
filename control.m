function H=control(H)
%Matrisin boyutuna g�re for d�ng�s� yapmak i�in boyutunu �l�t�m.
say=max(size(H));
%Matris elemanlar� �zerinde gezebilmek i�in d�rt adet for d�ng�s�
%olu�turdum. 
for i=1:1:say
    for j=1:1:say
        for k=1:1:say
            for l=1:1:say
%Ayn� indise sahip elemanlar� de�i�im yapmamas� i�in if ile kontrol ettim.
                if(i==k && j==l)
                    continue;
                else
                    if(H(i,j)==H(k,l))
                        % H matrisinin istenilen �zelliklerine g�re ayn�
                        % eleman� de�i�tirdim.
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