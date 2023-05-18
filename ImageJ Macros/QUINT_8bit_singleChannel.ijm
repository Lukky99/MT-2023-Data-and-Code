// macro to flip images vertically/horizontailly for proper orientation 


input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/Atlas_Alignment/QUINT/Brains/NWT/Raw/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/Atlas_Alignment/QUINT/Brains/NWT/Split/";


//list = getFileList(input);


function splitA(input, output, filename) {
	
	//new_filename = "merged_s1";
	run("Bio-Formats Importer", "open="+input +filename+" color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	run("16-bit");
	run("Flip Vertically");
	run("Make Composite");
	run("Scale...", "x=0.9 y=0.9 interpolation=Bilinear average create");
	run("Enhance Contrast", "saturated=0.2");
 	saveAs("jpg", output+new_filename);
	close();
	close();
	
//	run("Flip Horizontally");
}


list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	list_out = getFileList(output);
	e= 100+list_out.length;
	new_filename = "WF_NWT_s"+e;
	splitA(input, output, list[i]);
}