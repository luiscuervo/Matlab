

%----------------

count_harp=cumsum(HN_harp);
count_cit=cumsum(HN_cit);


Lseg_harp = round(LOCS_harp(1:count_harp(2)));
Lseg_cit = round(LOCS_cit(1:count_cit(2)));


Iseg_harp = round(PKS_harp(1:count_harp(2)));
Iseg_cit = round(PKS_cit(1:count_cit(2)));

A=musicspectrum(Lseg_harp,Iseg_harp);
B=musicspectrum(Lseg_cit,Iseg_cit);

