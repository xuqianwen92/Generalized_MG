function MG_out = Ineq_X( MG )
%UNTITLED6 Summary of this function goes here
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

%% Inequality constraints: lb<=x<=ub
%Power limits:
%UG
MG.UG.lb ;
MG.UG.ub ;
%CL
MG.CL.lb;
MG.CL.ub;
%ES
MG.ES.lb;
MG.ES.ub;
%EV
MG.EV.lb;
MG.EV.ub;

%UG
UG_in_lb = zeros(MG.horizon*MG.numofUG, 1);
UG_in_ub = MG.UG.ub ;
UG_flg_lb = zeros(MG.horizon*MG.numofUG, 1);

UG_out_lb = MG.UG.lb ;
UG_out_ub = zeros(MG.horizon*MG.numofUG, 1);
UG_flg_ub = ones(MG.horizon*MG.numofUG, 1);
%CL
CL_in_lb = zeros(MG.horizon*MG.numofCL, 1);
CL_in_ub = MG.CL.ub ;
CL_flg_lb = zeros(MG.horizon*MG.numofCL, 1);

CL_out_lb = MG.CL.lb ;
CL_out_ub = zeros(MG.horizon*MG.numofCL, 1);
CL_flg_ub = ones(MG.horizon*MG.numofCL, 1);
%ES
ES_in_lb = zeros(MG.horizon*MG.numofES, 1);
ES_in_ub = MG.ES.ub ;
ES_flg_lb = zeros(MG.horizon*MG.numofES, 1);

ES_out_lb = MG.ES.lb ;
ES_out_ub = zeros(MG.horizon*MG.numofES, 1);
ES_flg_ub = ones(MG.horizon*MG.numofES, 1);
%EV
%{
EV_in_lb = zeros(MG.horizon*MG.numofEV, 1);
EV_in_ub = MG.EV.ub ;
EV_flg_lb = zeros(MG.horizon*MG.numofEV, 1);

EV_out_lb = MG.EV.lb ;
EV_out_ub = zeros(MG.horizon*MG.numofEV, 1);
EV_flg_ub = ones(MG.horizon*MG.numofEV, 1);
%}
%Indicators:
%RE indicator: should be always 1
RE_flg_lb = reshape(ones(MG.horizon, MG.numofRE), [],1);
RE_flg_ub = reshape(ones(MG.horizon, MG.numofRE), [],1);
%Load0 indicator: should be always 1
L0_flg_lb = reshape(ones(MG.horizon, MG.numofL0), [],1);
L0_flg_ub = reshape(ones(MG.horizon, MG.numofL0), [],1);
%Load1 indicator
L1_flg_lb = reshape(zeros(MG.horizon, MG.numofL1), [],1);
L1_flg_ub = reshape(MG.L1.value(1:MG.horizon, 1:MG.numofL1)<0, [],1);
%Load2 indicator 
L2_lb = reshape(zeros(MG.horizon, MG.numofL2), [],1);
L2_ub = reshape(MG.L2.value(1:MG.horizon, 1:MG.numofL2)<0, [],1);
%Load2_ind_s
L2_flg_s_lb = reshape(zeros(MG.horizon+1, MG.numofL2), [],1);
L2_flg_s_ub = reshape(ones(MG.horizon+1, MG.numofL2), [],1);
%Load2_ind_e
L2_flg_e_lb = -reshape(ones(MG.horizon+1, MG.numofL2), [],1);
L2_flg_e_ub = reshape(zeros(MG.horizon+1, MG.numofL2), [],1);
%Load2_ind_e
%Indicators end
MG.lb = [ UG_in_lb; UG_out_lb; UG_flg_lb; ...
    CL_in_lb; CL_out_lb; CL_flg_lb; ...
    ES_in_lb; ES_out_lb; ES_flg_lb; ...
   % EV_in_lb; EV_out_lb; EV_flg_lb; ...
    RE_flg_lb; L0_flg_lb; L1_flg_lb; L2_lb; L2_flg_s_lb; L2_flg_e_lb ];
MG.ub = [ UG_in_ub; UG_out_ub; UG_flg_ub; ...
    CL_in_ub; CL_out_ub; CL_flg_ub; ...
    ES_in_ub; ES_out_ub; ES_flg_ub; ...
    %EV_in_ub; EV_out_ub; EV_flg_ub; ...
    RE_flg_ub; L0_flg_ub; L1_flg_ub; L2_ub; L2_flg_s_ub; L2_flg_e_ub ];

%Total:

MG_out=MG;
end
