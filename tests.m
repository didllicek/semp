%Juang 1. example
%c=test('example_juang1',1e-3);
%[c2,new_sys_spec2]=test1('semp_example',1e-3);
%[c2,new_sys_spec2]=test1('tank_janssen_example',1e-3);
%[c1,new_sys_spec1]=test1('sontag_contradiction',1e-3);
[c2,new_sys_spec2]=test1('sontag_constructed',1e-3)

%Juang 2. example
%c=test('example_juang2',1e-3);
%c=test1('example_juang2',1e-3);
%[c2,new_sys_spec2]=test1('example_juang2',1e-3);

%Juang 1. example - more than 1 output
%c=test('example_2_outputs',1e-3);
%c=test1('example_2_outputs',1e-3);

%Juang 1. example - change in matrix Ac
%c=test('example_change_Ac',1e-3);
%[c2,new_sys_spec2]=test1('example_change_Ac',1e-3);

%Sontag - contradiction
%c=test('sontag_contradiction',1e-3);
%[c1,new_sys_spec1]=test1('sontag_contradiction',1e-3);

%Sontag - constructed
%c=test('sontag_constructed',1e-3);
%%[c2,new_sys_spec2]=test1('sontag_constructed',1e-3);

%eig(new_sys_spec1.Ac)
%eig(new_sys_spec2.Ac)

%Lee and Juand - LTV approach example - doesn't work
%c=test('example_CBS_lee_juang',1e-3);
%c=test1('example_CBS_lee_juang',1e-3);

%Juang 1. example - 3 inputs
%c=test('example_juang1_3_inputs',1e-3);
%c=test1('example_juang1_3_inputs',1e-3);
%[c2,new_sys_spec2]=test1('example_juang1_3_inputs',1e-3);

%Juang 1. example - 3 inputs
%c=test('example_juang1_3_inputs_not_identified',1e-3);
%c=test1('example_juang1_3_inputs_not_identified',1e-3);

%Juang 1. example - 3 inputs - changed Nc3
%c=test('example_juang1_3_inputs_not_identified_change_Nc3',1e-3);
%c=test1('example_juang1_3_inputs_not_identified_change_Nc3',1e-3);


%......