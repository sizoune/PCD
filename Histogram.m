function [ citra ] = Histogram( citra_input )
%Fungsi untuk mendapatkan intensitas setiap pixel dari gambar 0 - 255
%by Muhammad Wildan Iskandar (1301144316)
%inisialisasi label dari 0 - 255
citra = zeros(256,1);
%mendapatkan intensitas
for i=1:size(citra_input,1)
    for j=1:size(citra_input,2)
        citra(citra_input(i,j)+1) = citra(citra_input(i,j)+1) + 1;
    end
end
end

