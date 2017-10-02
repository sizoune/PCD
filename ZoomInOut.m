function [ gambar ] = ZoomInOut( citra, type )
%Fungsi untuk memperbesar atau memperkecil ukuran image
%by Muhammad Wildan Iskandar (1301144316)
    %untuk mendapatkan banyak channel pada gambar
    jumChannel = size(citra,3);
    %jika jumlah channel = 3 maka gambar adalah RGB
    if jumChannel == 3
        %jika type = 1 maka lakukan zoom in atau diperbesar
        if type == 1
            %inisialisasi matriks hasil dimana matriks hasil = 2x lipat dari ukuran
            %gambar awal
            gambar = zeros(size(citra,1) * 2, size(citra,2) * 2, 3);
            %lakukan perulangan untuk setiap baris matriks
            for x = 1 : size(citra,1)
                %lakukan perulangan untuk setiap kolom matriks
                for y = 1 : size(citra,2)
                    i = 2 * (x-1) + 1;
                    j = 2 * (y-1) + 1;
                    gambar(i,j,:) = citra(x,y,:);
                    gambar(i+1,j,:) = citra(x,y,:);
                    gambar(i,j+1,:) = citra(x,y,:);
                    gambar(i+1,j+1,:) = citra(x,y,:);
                end
            end
        elseif type == 2
            %inisialisasi matriks hasil dimana matriks hasil = matriks awal
            %dibagi 2
            gambar = zeros(size(citra,1) / 2, size(citra,2) / 2, 3);
            for x = 1 : size(citra,1)
                %lakukan perulangan untuk setiap kolom matriks
                for y = 1 : size(citra,2)
                    i = 2 * (x-1) + 1;
                    j = 2 * (y-1) + 1;
                    gambar(x,y,:) = (citra(i,j,:) + citra(i+1,j,:) + citra(i,j+1,:) + citra(i+1,j+1,:))/4;
                end
            end
        end
    else
        %jika type = 1 maka lakukan zoom in atau diperbesar
        if type == 1
            gambar = zeros(size(citra,1) * 2, size(citra,2) * 2);
            %lakukan perulangan untuk setiap baris matriks
            for x = 1 : size(citra,1)
                %lakukan perulangan untuk setiap kolom matriks
                for y = 1 : size(citra,2)
                    i = 2 * (x-1) + 1;
                    j = 2 * (y-1) + 1;
                    gambar(x,y) = citra(x,y);
                    gambar(i+1,j) = citra(x,y);
                    gambar(i,j+1) = citra(x,y);
                    gambar(i+1,j+1) = citra(x,y);
                end
            end
        elseif type == 2
            gambar = zeros(round(size(citra,1) / 2), round(size(citra,2) / 2));
            for x = 1 : size(citra,1)
                %lakukan perulangan untuk setiap kolom matriks
                for y = 1 : size(citra,2)
                    i = 2 * (x-1) +1 ;
                    j = 2 * (y-1)+1;
                    gambar(x,y) = double (citra(i,j) + citra(i+1,j) + citra(i,j+1) + citra(i+1,j+1))/4;
                end
            end
        end
    end
    gambar = uint8(gambar);
end

