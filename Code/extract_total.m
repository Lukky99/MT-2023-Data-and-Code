

%initialize ap array from excel (manually)
%{
ap_array = [-0.8
-0.9
-1
-1.225
-1.275
-1.375
-1.575
-1.725
-1.875
-2
-2.1
-2.2
-2.3
];
%}

%OVERLAPPING PARTICLES AS FRACTION OF FB PARTICLES
%get numOLp2 variables from saved .mat files in folder XY and generate
%array
%set up input folder and search for all files with .mat
input = 'C:\Users\AG_Larkum\Desktop\Lukas_Edu_Data_Analysis\ColocalizationAnalysis_w_Cellpose\ALM\NWIT\Split/matlab_output';
filelist = dir(fullfile(input, '*.mat'));

%set up coloc array to fill, iterate through folder containing files
array_FB_total = [];
for i = 1:length(filelist)
    data = load(fullfile(input, filelist(i).name));

    if isfield(data, "nump2")
        nump2 = data.nump2;
        array_FB_total = [array_FB_total; nump2];
    end
end
%FB particels as fract of FB total particles
array_FB_fract = array_FB_total/sum(array_FB_total)

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

array_tdT_fract = array_tdT_total/sum(array_tdT_total)

%{
plot ap and coloc array against eachother
plot(ap_array, array_tdT_fract, 'o');
xlabel("AP from Bregma");
ylabel("tdT/TotaltdT");
title("Colocalizing Cell Distribution");
figure();
%}



