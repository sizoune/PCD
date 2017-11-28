function [ img_out ] = Erotion( img_in )
%Fungsi Erosi gambar
%by Muhammad Wildan Iskandar (1301144316)
img_out = zeros(size(img_in));
helper=zeros(size(img_in,1)+2,size(img_in,2)+2,size(img_in,3));
helper(2:size(helper,1)-1,2:size(helper,2)-1,:)=img_in;
%operasi dilasi
for i=1:size(helper,3)
    for j=2:size(helper,1)-1
        for k=2:size(helper,2)-1
            img_out(j-1,k-1,i)=min(min(helper(j-1:j+1,k-1:k+1,i)));
        end
    end
end
img_out=uint8(img_out);
end

