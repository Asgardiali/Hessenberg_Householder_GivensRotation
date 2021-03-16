t=input('Verici sayýsýný giriniz= ');
tx=input('Verici konum x= ');
ty=input('Verici konum y= ');
rx=input('Alýcý konum x= ');
ry=input('Alýcý konum y= ');
%Baþlangýçta matrisi boþ olarak tanýmladým tüm deðerlerini sýfýr verdim.
H=zeros(t,t);
%Matrisin tümdeðerlerine ulaþýlarak, istenilen rastgele gürültüleri
%oluþturdum. Daha sonra kullanýcý tarafýndan girilen konum bilgilerine göre
%mesafe ölçümü yapýlarak matris tekrardan güncellenecektir.
for k=1:1:t
    for i=1:1:t
        if(mod(i,2)==1 && mod(k,2)==1)
            %Uniform daðýlýmý temsil etmek için 0-1 arasýnda rastgele sayý veren rand fonksiyonunu kullandým.
            H(k,i)=rand(1);
            continue;
        elseif(mod(i,2)==0 && mod(k,2)==0)
            %Normal daðýlýmý temsil etmek için randn (normal deðiþkene göre rastgele sayý üretiyor) fonksiyonunu kullandým.
            H(k,i)=abs(randn(1));
            continue;
        else
            H(k,i)=1;
            continue;           
        end
    end
end
%Buradan elde ettiðim H matris verilerini Excel'de denemesi yaptým. Ayný
%herhangi bir rastgele deðiþken gelmemektedir.
H=control(H);

mesafe=sqrt(((tx-rx)^2)+((ty-ry)^2));
%H matrisinin son hali olarak mesafe ile çarptým ve aþaðýdaki sonucu elde
%ettim. Ýstenilen tüm deðerlere göre bir hesap yapýlmýþ oldu.
H=mesafe*H;



