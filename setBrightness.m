function [ imageBrightness ] = setBrightness( citra,type )
%Fungsi untuk mengatur Brightness gambar
%by Muhammad Wildan Iskandar (1301144316)
    if type == 1
        %jika type = 1 yaitu menerangkan maka citra akan ditambahkan dengan
        %50
        imageBrightness = citra + 50;
    elseif type == 2
        %jika type = 2 yaitu menggelapkan maka citra akan dikurangkan
        %dengan 50
        imageBrightness = citra - 50;
    elseif type == 3
        %jika type = 3 maka citra akan dikalikan dengan 1,5
        imageBrightness = citra * 1.5;
    elseif type == 4
        %jika type = 3 maka citra akan dibagi dengan 1,5
        imageBrightness = citra / 1.5;
    end
end

