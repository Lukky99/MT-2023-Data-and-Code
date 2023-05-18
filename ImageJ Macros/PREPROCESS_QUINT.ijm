// macro to flip images vertically/horizontailly for proper orientation 


input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/Atlas_Alignment/QUINT/Brains/ANO/Raw/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_Data_Analysis/Atlas_Alignment/QUINT/Brains/ANO/Split/";

function flipNsplitJPG(input, output, filename) {
	
	open(input+filename);
	//run("Flip Vertically");
	run("Split Channels");
	saveAs("Jpeg", output+filename+"tdT_s");
	close();
	saveAs("Jpeg", output+filename+"GFP_s");
	close();
	saveAs("Jpeg", output+filename+"FB_s");
	close();
//	run("Flip Horizontally");
}

list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	flipNsplitJPG(input, output, list[i]);
}

