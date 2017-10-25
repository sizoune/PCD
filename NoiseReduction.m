function [ citra ] = NoiseReduction( citra_input, tipe )
%Fungsi untuk mereduksi noise pada gambar
%by Muhammad Wildan Iskandar (1301144316)
citra = zeros(size(citra_input));
%proses reduksi noise
for z=1:size(citra_input,3)
    for x=1:size(citra_input,1)
        for y=1:size(citra_input,2)
            %jika tipe = 1 maka lakukan reduksi dengan mean filter
            if tipe == 1
                if (x==1) && (y==1)
                    citra(x,y,z) = (citra_input(x,y,z)+citra_input(x,y+1,z)+citra_input(x+1,y,z)+citra_input(x+1,y+1,z))/4;
                elseif (x==size(citra_input,1)) && (y==size(citra_input,2))
                    citra(x,y,z) = (citra_input(x,y,z)+citra_input(x,y-1,z)+citra_input(x-1,y,z)+citra_input(x-1,y-1,z))/4;
                elseif (x==size(citra_input,1)) && (y==1)
                    citra(x,y,z) = (citra_input(x,y,z)+citra_input(x,y+1,z)+citra_input(x-1,y,z)+citra_input(x-1,y+1,z))/4;
                elseif (x==1) && (y==size(citra_input,2))
                    citra(x,y,z) = (citra_input(x,y,z)+citra_input(x,y-1,z)+citra_input(x+1,y,z)+citra_input(x+1,y-1,z))/4;
                elseif x==1 
                    citra(x,y,z) = sum(sum(citra_input(x:x+1,y-1:y+1,z)))/6;
                elseif y==1
                    citra(x,y,z) = sum(sum(citra_input(x-1:x+1,y:y+1,z)))/6;
                elseif y==size(citra_input,2)
                    citra(x,y,z) = sum(sum(citra_input(x-1:x+1,y-1:y,z)))/6;
                elseif x==size(citra_input,1)
                    citra(x,y,z) = sum(sum(citra_input(x-1:x,y-1:y+1,z)))/6;
                else
                    citra(x,y,z) = sum(sum(citra_input(x-1:x+1,y-1:y+1,z)))/9;
                end
            %jika tipe = 2 maka lakukan reduksi dengan median filter
            elseif tipe == 2
                 if (x==1) && (y==1)
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x+1,y,z) citra_input(x+1,y+1,z)];
                elseif (x==size(citra_input,1)) && (y==size(citra_input,2))
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y-1,z)];
                elseif (x==size(citra_input,1)) && (y==1)
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z)];
                elseif (x==1) && (y==size(citra_input,2))
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x+1,y,z) citra_input(x+1,y-1,z)];
                elseif x==1 
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x,y+1,z) citra_input(x+1,y-1,z) citra_input(x+1,y,z) citra_input(x+1,y+1,z)];
                elseif y==1
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x-1,y+1,z) citra_input(x+1,y,z) citra_input(x-1,y,z) citra_input(x+1,y+1,z)];
                elseif y==size(citra_input,2)
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x,y-1,z) citra_input(x+1,y-1,z) citra_input(x+1,y,z)] ;
                elseif x==size(citra_input,1)
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z) citra_input(x,y-1,z) citra_input(x,y+1,z)];
                else
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z) citra_input(x,y-1,z) citra_input(x,y+1,z) citra_input(x+1,y-1,z) citra_input(x+1,y+1,z) citra_input(x+1,y,z)];
                end
                nilaitengah=median(sort(temp));
                citra(x,y,z) = nilaitengah;
             %jika tipe = 2 maka lakukan reduksi dengan modus filter
             elseif tipe == 3
                 if (x==1) && (y==1)
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x+1,y,z) citra_input(x+1,y+1,z)];
                elseif (x==size(citra_input,1)) && (y==size(citra_input,2))
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y-1,z)];
                elseif (x==size(citra_input,1)) && (y==1)
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z)];
                elseif (x==1) && (y==size(citra_input,2))
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x+1,y,z) citra_input(x+1,y-1,z)];
                elseif x==1 
                    temp = [citra_input(x,y,z) citra_input(x,y-1,z) citra_input(x,y+1,z) citra_input(x+1,y-1,z) citra_input(x+1,y,z) citra_input(x+1,y+1,z)];
                elseif y==1
                    temp = [citra_input(x,y,z) citra_input(x,y+1,z) citra_input(x-1,y+1,z) citra_input(x+1,y,z) citra_input(x-1,y,z) citra_input(x+1,y+1,z)];
                elseif y==size(citra_input,2)
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x,y-1,z) citra_input(x+1,y-1,z) citra_input(x+1,y,z)] ;
                elseif x==size(citra_input,1)
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z) citra_input(x,y-1,z) citra_input(x,y+1,z)];
                else
                    temp = [citra_input(x,y,z) citra_input(x-1,y-1,z) citra_input(x-1,y,z) citra_input(x-1,y+1,z) citra_input(x,y-1,z) citra_input(x,y+1,z) citra_input(x+1,y-1,z) citra_input(x+1,y+1,z) citra_input(x+1,y,z)];
                end
                modus=mode(sort(temp));
                citra(x,y,z) = modus;
            end
        end
    end
end
citra=uint8(citra);
end

