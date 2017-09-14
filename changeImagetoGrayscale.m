function [ greyscale ] = changeImagetoGrayscale( image )
%Fungsi untuk mengubah gambar menjadi grayscale atau abu abu
%by Muhammad Wildan Iskandar (1301144316)
    %cek apakah image sudah grayscale atau belum
    totalcolor = size(image,3);
    if totalcolor == 3
        %jika image belum grayscale
        %dapatkan nilai matriks warna merah
        R = image(:,:,1);
        %dapatkan nilai matriks warna hijau
        G = image(:,:,2);
        %dapatkan nilai matriks warna Biru
        B = image(:,:,3);
        %ubah menjadi greyscale dengan menambahkan nilai RGB lalu dibagi 3
        greyscale = double(double(R)+double(G)+double(B))/3;
        %ubah menjadi skala 0 - 255 (agar tidak diganti putih semua)
        greyscale = uint8(greyscale);
    else
        %jika gambar sudah greyscale
        greyscale = image;
    end
end

