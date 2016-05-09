function MG_out = Ineq_EV_SOC_T( MG )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
%% Variables indices:
%MG.UG_in, MG.UG_out, MG.UG_flg;
%MG.CL_in, MG.CL_out, MG.CL_flg;
%MG.ES_in, MG.ES_out, MG.ES_flg;
%MG.RE_in, (flg)
%MG.L0_out; (flg)
%MG.L1_out; (flg)
%MG.L2_out; (flg)
%MG.L2_ind_s; MG.L2_ind_e;

numofRows = MG.numofEV;
%EV SOC
A_EV = [];
for i = 1:1:MG.numofEV
    A_EV = blkdiag(A_EV, tril(ones(MG.horizon),0));
end

%UG:
A_UG_in  = zeros(numofRows, MG.horizon*MG.numofUG);
A_UG_out = zeros(numofRows, MG.horizon*MG.numofUG);
A_UG_flg = zeros(numofRows, MG.horizon*MG.numofUG);
%CL:
A_CL_in  = zeros(numofRows, MG.horizon*MG.numofCL);
A_CL_out = zeros(numofRows, MG.horizon*MG.numofCL);
A_CL_flg = zeros(numofRows, MG.horizon*MG.numofCL);
%ES: 
A_ES_in  = zeros(numofRows, MG.horizon*MG.numofES);
A_ES_out = zeros(numofRows, MG.horizon*MG.numofES);
A_ES_flg = zeros(numofRows, MG.horizon*MG.numofES);
%EV: 
A_EV = [];
for i = 1:1:MG.numofEV
    A_EV = blkdiag(A_EV, ones(1,MG.horizon));
end
A_EV_in  = A_EV; 
A_EV_out = A_EV; 
A_EV_flg = zeros(numofRows, MG.horizon*MG.numofEV);
%RE: (flg)
A_RE_in  = zeros(numofRows, MG.horizon*MG.numofRE);
%L0: (flg)
A_L0_in  = zeros(numofRows, MG.horizon*MG.numofL0);
%L1: (flg)
A_L1_in  = zeros(numofRows, MG.horizon*MG.numofL1);
%L2: (flg)
A_L2_in  = zeros(numofRows, MG.horizon*MG.numofL2);
%L2: (flg_s) (flg_e)
A_L2_flg_s = zeros(numofRows, (MG.horizon+1)*MG.numofL2);
A_L2_flg_e = zeros(numofRows, (MG.horizon+1)*MG.numofL2);

A_min = [ ...
    A_UG_in, A_UG_out, A_UG_flg, ...
    A_CL_in, A_CL_out, A_CL_flg, ...
    A_ES_in, A_ES_out, A_ES_flg, ...
    A_EV_in, A_EV_out, A_EV_flg, ...
    A_RE_in, ...
    A_L0_in, ...
    A_L1_in, ...
    A_L2_in, ...
    A_L2_flg_s, A_L2_flg_e ];

b_min = reshape( -MG.EV.SOC_T+MG.EV.SOC_0, MG.numofEV, 1 );

MG.A.all = [ MG.A.all; A_min ];
MG.b.all = [ MG.b.all; b_min ];

MG_out = MG;
end

