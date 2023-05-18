// Macro for saving split z-stack channels as tif and keep stacks 

input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/ColocalizationAnalysis_w_Cellpose/TP_NEW/RTEP/Raw/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/ColocalizationAnalysis_w_Cellpose/TP_NEW/RTEP/Split/";

function splitNtif(input, output, filename) {
	
	run("Bio-Formats Importer", "open="+input +filename+" color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	run("Split Channels");
	saveAs("Tiff", output+filename+"c1");
	close();
	saveAs("Tiff", output+filename+"c2");
	close();
	close();
}

list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	splitNtif(input, output, list[i]);
}

