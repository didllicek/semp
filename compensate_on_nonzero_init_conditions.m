function Hps =  compensate_on_nonzero_init_conditions(A,C,Hps,sys_spec,id_meth_params)

for i=2:id_meth_params.p
    Hp=Hps{i};
    comp=[];
    for j=i:(id_meth_params.alpha+i-1)     
        comp=[comp;(C*((A^(j))*sys_spec.x0))*ones(1,sys_spec.r)];
    end
    comp
    Hp=Hp-comp;
    Hps{i}=Hp;
    
end
end

