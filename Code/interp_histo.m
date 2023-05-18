function [col_tdt_comp] = interp_histo(ap_complete,coloc_tdT,ap_pos)
    col_tdt_comp=NaN(length(ap_complete),1);

    for jj=1:length(coloc_tdT)
        [~,xd]=min(abs(ap_complete-ap_pos(jj)));
        col_tdt_comp(xd)=coloc_tdT(jj);
    end
    cord_aps=find(~isnan(col_tdt_comp));
    space_aps=diff(cord_aps);
    for tt=1:length(space_aps)
        if cord_aps(tt+1)-cord_aps(tt)>1
           interpol=(col_tdt_comp(cord_aps(tt+1))-col_tdt_comp(cord_aps(tt)))/space_aps(tt);
           for dd=1:space_aps(tt)-1
              col_tdt_comp(cord_aps(tt)+dd)= col_tdt_comp(cord_aps(tt))+interpol*dd;
           end
        end
    end
    col_tdt_comp(isnan(col_tdt_comp))=0;
end