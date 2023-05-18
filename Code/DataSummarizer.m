[SNR_for, SNR_dir] = uigetfile('MultiSelect', 'on','*.mat','SNR Brains');

[ALM_for, ALM_dir] = uigetfile('MultiSelect', 'on','*.mat','ALM Brains');
%%

[ap_complete,col_tdt_comp,ALM_col_tdt_comp] = AP_interp(SNR_for,SNR_dir,ALM_for,ALM_dir,'array_FB_fract');

figure()
hold on
for ii = 1:size(col_tdt_comp,2)
pk=plot(ap_complete,col_tdt_comp(:,ii),'g--');
pk.Color(4)=0.5;
end
for ii = 1:size(ALM_col_tdt_comp,2)
pk=plot(ap_complete,ALM_col_tdt_comp(:,ii),'r--');
pk.Color(4)=0.5;
end
stdshade(col_tdt_comp',0.1,'g',ap_complete')
stdshade(ALM_col_tdt_comp',0.1,'r',ap_complete')

% figure()
% hold on
% for ii = 1:size(col_tdt_comp,2)
% pk=plot(ap_complete,col_tdt_comp(:,ii),'g--');
% pk.Color(4)=0.5;
% end
% for ii = 1:size(ALM_col_tdt_comp,2)
% pk=plot(ap_complete,ALM_col_tdt_comp(:,ii),'k--');
% pk.Color(4)=0.5;
% end
% stdshade(col_tdt_comp',0.1,'g',ap_complete')
% stdshade(ALM_col_tdt_comp',0.1,'k',ap_complete')
%%
nu_ALM=nanmean(ALM_col_tdt_comp,2);

nu_SNR=nanmean(col_tdt_comp,2);

brain_type=[ones(length(nu_ALM),1); zeros(length(nu_SNR),1)];

[prob_clust]=stat_histo(nu_ALM,nu_SNR,brain_type);









