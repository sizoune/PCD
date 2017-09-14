function [ imageBrightness ] = setBrightness( citra,type )
%Fungsi untuk mengatur Brightness gambar
%by Muhammad Wildan Iskandar (1301144316)
    if type == 1
        %jika type = 1 yaitu menerangkan maka citra akan ditambahkan dengan
        %50
        imageBrightness = citra + 50;
    else
        %jika type bukan 1 yaitu menggelapkan maka citra akan dikurangkan
        %dengan 50
        imageBrightness = citra - 50;
    end
end

