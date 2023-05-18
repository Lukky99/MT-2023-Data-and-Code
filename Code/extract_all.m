clear;
close all;

filename = "TREP";

%CHANGE FOR EACH BRAIN!

%initialize ap array from excel (manually)
ap_array = [
-1.075
-1.175
-1.325
-1.425
-1.525
-1.625
-1.7
-1.8
-1.9
-2
-2.1
-2.2

];

%OVERLAPPING PARTICLES AS FRACTION OF FB PARTICLES
%get numOLp2 variables from saved .mat files in folder XY and generate
%array
%set up input folder and search for all files with .mat
input = 'C:\Users\AG_Larkum\Desktop\Lukas_Edu_Data_Analysis\ColocalizationAnalysis_w_Cellpose\TP_NEW\TREP\matlab_output';
wrong_filelist = dir(fullfile(input, '*.mat'));
filelist = natsortfiles(wrong_filelist);

%set up coloc array to fill, iterate through folder containing files
coloc_array_FB = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "numOLp2")
        numOLp2 = data.numOLp2;
        coloc_array_FB = [coloc_array_FB; numOLp2];
    end
end

%{
plot ap and coloc array against eachother
figure()
hold on
plot(ap_array, coloc_array_FB, 'o');
plot(ap_array+0.05, coloc_array_FB, 'ko');

xlabel("AP from Bregma");
ylabel("Coloc/TotalFB");
title("Colocalizing Cell Distribution");
%}




%OVERLAPPING PARTICLES AS FRACTION OF tdT PARTICLES
%set up coloc array to fill, iterate through folder containing files
coloc_array_tdT = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "numOLp1")
        numOLp1 = data.numOLp1;
        coloc_array_tdT = [coloc_array_tdT; numOLp1];
    end
end



%{
% plot ap and coloc array against eachother
plot(ap_array, coloc_array_tdT, 'o');
xlabel("AP from Bregma");
ylabel("Coloc/TotaltdT");
title("Colocalizing Cell Distribution");
%}

array_FB_total = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "nump2")
        nump2 = data.nump2;
        array_FB_total = [array_FB_total; nump2];
    end
end
%FB particels as fract of FB total particles
array_FB_fract = array_FB_total/sum(array_FB_total);
%{
plot ap and coloc array against eachother
plot(ap_array, array_FB_fract, 'o');
xlabel("AP from Bregma");
ylabel("FB/TotalFB");
title("Colocalizing Cell Distribution");
figure();
%}




%OVERLAPPING PARTICLES AS FRACTION OF tdT PARTICLES
%set up coloc array to fill, iterate through folder containing files
array_tdT_total = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "nump1")
        nump1 = data.nump1;
        array_tdT_total = [array_tdT_total; nump1];
    end
end

array_tdT_fract = array_tdT_total/sum(array_tdT_total);




%extract total numOL and make array
array_numOL = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "numOL")
        numOL = data.numOL;
        array_numOL = [array_numOL; numOL];
    end
end

%NEW FRACT FOR FB%
singleAP_FB_fract = array_FB_total./(array_FB_total+array_tdT_total-array_numOL);
allAP_FB_fract = array_FB_total/(sum(array_FB_total)+sum(array_tdT_total)-sum(array_numOL));
%NEW FRACT FOR tdT%
singleAP_tdT_fract = array_tdT_total./(array_FB_total+array_tdT_total-array_numOL);
allAP_tdT_fract = array_tdT_total/(sum(array_tdT_total)+sum(array_tdT_total)-sum(array_numOL));


%NEW FRACT FOR COLOC%
allcells = sum(array_tdT_total)+sum(array_FB_total)-sum(array_numOL)
allCELLS_AP_Coloc_fract = array_numOL./allcells;

normOL=array_numOL./max(array_numOL)
Coloc_distrib = array_numOL./sum(array_numOL);
allAP_ColoctdT_fract = array_numOL./sum(array_tdT_total);
allAP_ColocFB_fract = array_numOL./sum(array_FB_total);

%%%%BARGRAPH STACKED WITH DISTRIBUTIONS 0 to 1
numOLtot_array = array_numOL./(array_tdT_total+array_FB_total-array_numOL);
numTdt_tot_array = (array_tdT_total-array_numOL)./(array_tdT_total+array_FB_total-array_numOL);
numFB_tot_array = (array_FB_total-array_numOL)./(array_tdT_total+array_FB_total-array_numOL);

lul=numOLtot_array+numTdt_tot_array+numFB_tot_array;
y=horzcat(numTdt_tot_array,numOLtot_array,numFB_tot_array);
figure()
%bar(ap_array, y,'stacked')

%{
plot ap and coloc array against eachother
plot(ap_array, array_tdT_fract, 'o');
xlabel("AP from Bregma");
ylabel("tdT/TotaltdT");
title("Colocalizing Cell Distribution");
figure();
%}

save(filename);


