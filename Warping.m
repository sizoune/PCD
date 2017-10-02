function [ citra ] = Warping( citra_input )
%Fungsi untuk warping gambar menjadi bentuk jajar genjang
%by Muhammad Wildan Iskandar (1301144316)
%untuk mendapatkan banyak channel pada gambar
jumChannel = size(citra_input,3);
%jika jumlah channel = 3 maka gambar adalah RGB
if jumChannel == 3
   %inisiasi matriks zero sebagai hasil warping
    citra = zeros(size(citra_input,1),size(citra_input,2),3);
    %proses warping gambar
    for i=1:size(citra_input,1) 
        for j=1:size(citra_input,2)
            citra(i,(size(citra_input,1)-mod(i-1,size(citra_input,1)))+(j-1),:)=citra_input(i,j,:);
        end
    end
%gambar adalah grayscale
else
    %inisiasi matriks zero sebagai hasil warping
    citra = zeros(size(citra_input,1),size(citra_input,2));
    %proses warping gambar
    for i=1:size(citra_input,1)
        for j=1:size(citra_input,2)
            citra(i,(size(citra_input,1)-mod(i-1,size(citra_input,1)))+(j-1))=citra_input(i,j);
        end
    end
end
citra = uint8(citra);
end

