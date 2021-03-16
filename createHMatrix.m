t=input('Verici say�s�n� giriniz= ');
tx=input('Verici konum x= ');
ty=input('Verici konum y= ');
rx=input('Al�c� konum x= ');
ry=input('Al�c� konum y= ');
%Ba�lang��ta matrisi bo� olarak tan�mlad�m t�m de�erlerini s�f�r verdim.
H=zeros(t,t);
%Matrisin t�mde�erlerine ula��larak, istenilen rastgele g�r�lt�leri
%olu�turdum. Daha sonra kullan�c� taraf�ndan girilen konum bilgilerine g�re
%mesafe �l��m� yap�larak matris tekrardan g�ncellenecektir.
for k=1:1:t
    for i=1:1:t
        if(mod(i,2)==1 && mod(k,2)==1)
            %Uniform da��l�m� temsil etmek i�in 0-1 aras�nda rastgele say� veren rand fonksiyonunu kulland�m.
            H(k,i)=rand(1);
            continue;
        elseif(mod(i,2)==0 && mod(k,2)==0)
            %Normal da��l�m� temsil etmek i�in randn (normal de�i�kene g�re rastgele say� �retiyor) fonksiyonunu kulland�m.
            H(k,i)=abs(randn(1));
            continue;
        else
            H(k,i)=1;
            continue;           
        end
    end
end
%Buradan elde etti�im H matris verilerini Excel'de denemesi yapt�m. Ayn�
%herhangi bir rastgele de�i�ken gelmemektedir.
H=control(H);

mesafe=sqrt(((tx-rx)^2)+((ty-ry)^2));
%H matrisinin son hali olarak mesafe ile �arpt�m ve a�a��daki sonucu elde
%ettim. �stenilen t�m de�erlere g�re bir hesap yap�lm�� oldu.
H=mesafe*H;



