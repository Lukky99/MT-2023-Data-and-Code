// Macro for changing n2d files from 16bit to 8bit, splitting channels and saving as jpeg in new folder **/
// CHECK FOR RIGHT CHANNEL ASSIGNMENT MANUALLY UNTIL CERTAIN THAT CHANNELS ARE CORRECT AND UNIFORM WITHIN BRAINS! 
//n2d stays in file name .. idk how to change

input = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/All/";
output = "C:/Users/AG_Larkum/Desktop/Lukas_Edu_RawData/WideField/NWIT/splitNtiff/";

function splitNjpg(input, output, filename) {
			run("Bio-Formats Importer", "open="+input +filename+" color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
			
			run("8-bit");
			
			run("Split Channels");
			
			saveAs("Jpeg", output+filename+"c1");
			close();
			saveAs("Jpeg", output+filename+"c2");
			close();
			saveAs("Jpeg", output+filename+"c3");
			close();

}

list = getFileList(input);
for (i = 0; i < list.length; i++) {
	print(output);
	splitNjpg(input, output, list[i]);
}

