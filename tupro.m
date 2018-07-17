clc;
clear;

tampungtrain=xlsread('NormalisasiTrain.xlsx');
tampung2test=tampungtrain(70001:90000,1:10);
tampung3test=tampungtrain(70001:90000,1:11);
tampung2train=tampungtrain(1:70000,1:11);
tampung4test = tampung2test;
neighbor = [];
neighbor2 =[];
neighbor3 = [];
neighbor4 = [];
%tampung3 =[];
tampung=0;
satu = 0;
nol = 0;
error = 0;
benar = 0;

m=31;
for i=1:size(tampung2test,1)
    nol = 0;
    satu = 0;
    for j=1:size(tampung2train,1)
        tampung = 0;
        for k=1:size(tampung2test,2)
            tampung=tampung +((tampung2test(i,k)-tampung2train(j,k)).^2);
        end
        hTampung = sqrt(tampung);
        neighbor4(j,1) = hTampung;
        neighbor4(j,2)=tampung2train(j,11);
    end
    
    neighbor=sortrows(neighbor4,1);
    %for loopn=1:size(neighbor)
       % for loopm = 1:size(neighbor4,1)
         %   if(neighbor(loopn) == neighbor4(loopm,1))
        %        neighbor2(loopn,1) = neighbor(loopn);
       %         neighbor2(loopn,2) = neighbor4(loopm,2);
      %      end
     %   end
    %end
        
    for l=1:m 
        neighbor3(l,1:2)= neighbor(l,1:2);
    end
    for n=1:size(neighbor3,1)
        if(neighbor3(n,2) == 1)
            satu = satu + 1;
        end
        if(neighbor3(n,2) == 0)
            nol = nol + 1;
        end
    end
    if (nol > satu)
        tampung4test(i,11) = 0;
    else
        tampung4test(i,11)= 1;
    end
end

for o=1:size(tampung2test,1)
    if(tampung4test(o,11) == tampung3test(o,11))
        benar = benar + 1;
    else
        error = error + 1;
    end
end
accuracy = (benar/(benar+error))* 100;

    
        
        
    