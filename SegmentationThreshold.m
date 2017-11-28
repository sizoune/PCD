function [ citra ] = SegmentationThreshold( citra_input, redMin, redMax, greenMin, greenMax, blueMin, blueMax )
%Fungsi untuk menlakukan segmentasi pada gambar
%by Muhammad Wildan Iskandar (1301144316)
citra = zeros(size(citra_input));
for i=1:size(citra_input,1)
    for j=1:size(citra_input,2)
        red = citra_input(i,j,1);
        green = citra_input(i,j,2);
        blue = citra_input(i,j,3);
        if ((red >= redMin) && (red <= redMax)) && ((green >= greenMin) && (green <= greenMax)) && ((blue >= blueMin) && (blue <= blueMax))
            citra(i,j) = 255;
        end
    end
end
citra=uint8(citra);
end

