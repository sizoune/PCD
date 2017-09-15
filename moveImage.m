function [ image ] = moveImage( citra,type )
%fungsi untuk menggeser image
%by Muhammad Wildan Iskandar (1301144316)
    %inisialisasi matriks 0 sebanyak ukuran citra
    image = zeros(size(citra));
    %untuk mendapatkan banyak matriks, atau mendeteksi apakah gambar adalah
    %RGB atau greyscale
    totalmatriks = size(citra,3);
    %jika gambar adalah RGB
    if totalmatriks == 3
        %jika type = 1 geser gambar ke kanan sebanyak 1 space
        if type == 1
            %untuk semua channel (RGB)
            for i = 1 : size(citra,3)
                image(:,2:size(citra,2),i) = citra(:,1:size(citra,2)-1,i); 
            end
        %jika type = 2 geser gambar ke kiri sebanyak 1 space
        elseif type == 2
            for i = 1 : size(citra,3)
                image(:,1:size(citra,2)-1,i) = citra(:,2:size(citra,2),i); 
            end
        %jika type = 3 geser gambar ke bawah sebanyak 1 space
        elseif type == 3
            for i = 1 : size(citra,3)
                image(2:size(citra,2),:,i) = citra(1:size(citra,2)-1,:,i); 
            end
        %jika type = 4 geser gambar ke atas sebanyak 1 space
        elseif type == 4
            for i = 1 : size(citra,3)
                image(1:size(citra,2)-1,:,i) = citra(2:size(citra,2),:,i); 
            end
        end
    %jika gambar adalah greyscale
    else
        %jika type = 1 geser gambar ke kanan sebanyak 1 space
        if type == 1
            image(:,2:size(citra,2)) = citra(:,1:size(citra,2)-1); 
        %jika type = 2 geser gambar ke kiri sebanyak 1 space
        elseif type == 2           
            image(:,1:size(citra,2)-1) = citra(:,2:size(citra,2)); 
        %jika type = 3 geser gambar ke bawah sebanyak 1 space
        elseif type == 3         
            image(2:size(citra,2),:) = citra(1:size(citra,2)-1,:);             
        %jika type = 4 geser gambar ke atas sebanyak 1 space
        elseif type == 4            
            image(1:size(citra,2)-1,:) = citra(2:size(citra,2),:);            
        end
    end
    image = uint8(image);
end

