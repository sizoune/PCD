function [ citra ] = Croping( citra_input , row_start, row_end, col_start, col_end )
%Fungsi untuk crop gambar sesuai pixel
%by Muhammad Wildan Iskandar (1301144316)
%untuk mendapatkan banyak channel pada gambar
jumChannel = size(citra_input,3);
%jika jumlah channel = 3 maka gambar adalah RGB
if jumChannel == 3
    %inisialisasi matriks hasil crop
    citra = zeros(row_end-row_start,col_end-col_start,3);
    citra(row_start:row_end,col_start:col_end,:) = citra_input(row_start:row_end,col_start:col_end,:);
%jika gambar adalah grayscale
else
    %inisialisasi matriks hasil crop
    citra = zeros(row_end-row_start,col_end-col_start);
    citra(row_start:row_end,col_start:col_end) = citra_input(row_start:row_end,col_start:col_end);
end
citra = uint8(citra);
end

