function [ap_complete,col_tdt_comp,ALM_col_tdt_comp] = AP_interp(SNR_for,SNR_dir,ALM_for,ALM_dir,data_type)
ap_complete=(-2.6:0.05:-0.8)';
col_tdt_comp=[];
ALM_col_tdt_comp=[];

for ii=1:length(SNR_for)    
    if iscell(SNR_for)
        lul=load(strcat(SNR_dir,SNR_for{1,ii}),'ap_array');
    else
       lul=load(strcat(SNR_dir,SNR_for),'ap_array'); 
    end    
    ap_pos=lul.ap_array;
    if iscell(SNR_for)
        lul=load(strcat(SNR_dir,SNR_for{1,ii}),data_type);
    else
       lul=load(strcat(SNR_dir,SNR_for),data_type); 
    end    
    coloc_tdT=lul.(data_type);
    [col_tdt_comp] = horzcat(col_tdt_comp,interp_histo(ap_complete,coloc_tdT,ap_pos));
end

for ii=1:length(ALM_for)
    if iscell(ALM_for)
        lul=load(strcat(ALM_dir,ALM_for{1,ii}),'ap_array');
    else
       lul=load(strcat(ALM_dir,ALM_for),'ap_array'); 
    end
    ap_pos=lul.ap_array;
    if iscell(ALM_for)
        lul=load(strcat(ALM_dir,ALM_for{1,ii}),data_type);
    else
       lul=load(strcat(ALM_dir,ALM_for),data_type); 
    end
    coloc_tdT=lul.(data_type);
    [ALM_col_tdt_comp] = horzcat(ALM_col_tdt_comp,interp_histo(ap_complete,coloc_tdT,ap_pos));
end
end