// macro to flip images vertically/horizontailly for proper orientation 


input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/splitNtiff/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/Flipped/";

function splitNtif(input, output, filename) {
	
	run("Bio-Formats Importer", "open="+input +filename+" color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	run("Flip Vertically");
	saveAs(output+filename);
	close();
//	run("Flip Horizontally");
}

list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	splitNtif(input, output, list[i]);
}
