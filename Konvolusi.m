function [ citra ] = Konvolusi( citra_input, kernel )
%Fungsi untuk membuat gambar di konvolusi dengan kernel
%by Muhammad Wildan Iskandar (1301144316)
%inisialisasi matriks hasil konolusi
citra = zeros(size(citra_input,1),size(citra_input,2),size(citra_input,3));
%temp matriks dimana setiap bagian atas, bawah, kiri, dan kanan gambar diisi 0
tmp = zeros(size(citra_input,1)+2,size(citra_input,2)+2,size(citra_input,3));
tmp(2:size(tmp,1)-1,2:size(tmp,2)-1,:) = citra_input;
%proses konvolusi
for i=1 : size(citra_input,3)
    for j=1 : size(citra_input,1)
        for k=1 : size(citra_input,2)
            citra(j,k,i) = sum(sum(tmp(j:j+2,k:k+2,i).*kernel));
        end
    end
end
citra = uint8(citra);
end

