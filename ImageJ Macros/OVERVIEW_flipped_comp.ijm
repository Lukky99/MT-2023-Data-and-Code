// macro to flip images vertically and make composite of channels for better orientation 


input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/ANO/VM/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/ANO/Concat/";

function flipNmerge(input, output, filename) {
	
	run("Bio-Formats Importer", "open="+input +filename+" color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	//run("Flip Vertically", "stack");
	run("Split Channels");
	close("C2-"+input +filename+"");
	selectWindow("C1-"+input +filename+"");
	run("Enhance Contrast", "saturated=0.1");
	run("Merge Channels...", "c1=C1-"+input +filename+" c5=C3-"+input +filename+" create");
	saveAs("Jpg", output+filename);
	close();
//	run("Flip Horizontally");
}

list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	flipNmerge(input, output, list[i]);
}






















run("Make Composite");
run("Undo");
open("C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/24012023_NWIT/WF_NWIT_sd4_sl10.nd2");
//run("Brightness/Contrast...");
run("Make Composite");
selectWindow("WF_NWIT_sd4_sl10.nd2");
selectWindow("WF_NWIT_sd4_sl10.nd2");
open("C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/24012023_NWIT/WF_NWIT_sd4_sl10.nd2");
run("Split Channels");
selectWindow("C2-WF_NWIT_sd4_sl10.nd2");
run("Merge Channels...", "c1=C1-WF_NWIT_sd4_sl10.nd2 c3=C3-WF_NWIT_sd4_sl10.nd2 create");
close();
close();
selectWindow("WF_NWIT_sd4_sl10.nd2");
close();
