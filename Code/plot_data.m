%plot brains against ap_array which entails entire VM thalamus
%but with specific AP positions determined w QickNII
clear all;

%hard coded ap array encompassing entire AP of VM
ap_array = [-0.8
-0.9
-1
-1.1
-1.2
-1.3
-1.4
-1.5
-1.6
-1.7
-1.8
-1.9
-2
-2.1
-2.2
]

x = ap_array;


input = 'C:\Users\AG_Larkum\Desktop\Lukas_Edu_Data_Analysis\Coloc_to_AP\all_variables';
filelist = dir(fullfile(input, '*.mat'));

%iterate through folder containing files and extracts variables ap_array,
%coloc_FB and _tdT as well as total numbers nump1 nump2 and their fractions
%of one brain/mouse
%renames them to file name (mouse / brain name)
for i = 1:length(filelist)
    file_name = filelist(i).name
    data = load(fullfile(input, filelist(i).name));
    if isfield(data, "ap_array")
        ap_array = data.ap_array;
        var_name_AP = strrep(file_name, '.mat', '_AP');
        eval([var_name_AP ' = ap_array'])

        isfield(data, "array_FB_fract")
        array_FB_fract = data.array_FB_fract;
        var_name = strrep(file_name, '.mat', '_FB_fract');
        eval([var_name ' = array_FB_fract'])

         isfield(data, "array_FB_total")
        array_FB_total = data.array_FB_total;
        var_name = strrep(file_name, '.mat', '_FB_tot');
        eval([var_name ' = array_FB_total'])

         isfield(data, "array_tdT_fract")
        array_tdT_fract = data.array_tdT_fract;
        var_name = strrep(file_name, '.mat', '_tdT_fract');
        eval([var_name ' = array_tdT_fract'])

         isfield(data, "array_tdT_total")
        array_tdT_total = data.array_tdT_total;
        var_name = strrep(file_name, '.mat', '_tdT_tot');
        eval([var_name ' = array_tdT_total'])

         isfield(data, "coloc_array_FB")
        coloc_array_FB = data.coloc_array_FB;
        var_name = strrep(file_name, '.mat', '_coloc_FB');
        eval([var_name ' = coloc_array_FB'])

        isfield(data, "coloc_array_tdT")
        coloc_array_tdT = data.coloc_array_tdT;
        var_name = strrep(file_name, '.mat', '_coloc_tdT');
        eval([var_name ' = coloc_array_tdT'])

    end
end



%plot respective variables against AP coords with individual AP coords of elements 
hold on
plot(NWIT_AP, NWIT_FB_fract, "-*");
plot(ANO_AP, ANO_FB_fract, "-*");
plot(NWT_AP, NWT_FB_fract, "-*");

plot(SNRM2_AP, SNRM2_coloc_FB, "-o");
plot(SNRM3_AP, SNRM3_coloc_FB, "-o");
plot(WIT_AP, WIT_coloc_FB, "r-o");
%plot(TREP_AP, TREP_FB_fract, "g-o");
%plot(TREP_AP, TREP_tdT_fract, "r-o");
%plot(TREP_AP, TREP_coloc_FB, "y-o");




%

