function [Ac_trans,Bc_trans,C_trans,D_trans,Ncs_trans,sys_spec,new_sys_spec]=bilinear_system_identification_juang(dir)
    %read input data and put them to the structure
    [sys_spec,id_meth_params]=inputs_processing(dir);
    
    Ac_trans=[];Bc_trans=[];C_trans=[];D_trans=[];Ncs_trans=[];
    
    %new I/O equivalent bilinear system
    new_sys_spec=struct;
    new_sys_spec.r=id_meth_params.r;
    new_sys_spec.m=id_meth_params.m;
    
    
    %generate or read measured input/output 
    [Yp,X_all,U]=generate_output_data(id_meth_params.r,id_meth_params,sys_spec)
    X_all;
    [H1,h1_up]=generateHankelMatrix(Yp,id_meth_params.alpha,id_meth_params.beta,id_meth_params.m,1)
    
    
    %first part
    [new_sys_spec.Ac,new_sys_spec.C,new_sys_spec.n,x_1,x_l0,U1_up,A,failed]=first_step(H1,h1_up,id_meth_params);
    new_sys_spec.Ac
    new_sys_spec.C
    
    
    disp('eigen values original Ac and identified Ac')
    eig(new_sys_spec.Ac)
    eig(sys_spec.Ac)
    if(failed)
        disp('identification failed!')
        return
    end
    %second part 
    [all_Ai_dashed,all_bi_dashed,X] = second_step(Yp,A,U1_up,x_l0,id_meth_params);
    %all_Ai_dashed{1}
    %all_bi_dashed{1}
    %all_Ai_dashed{2}
    %all_bi_dashed{2}
    
    [new_sys_spec.x0,new_sys_spec.D]=third_step(Yp,all_Ai_dashed,all_bi_dashed,x_1,U,new_sys_spec.C,id_meth_params,X)
    disp('identified initial condition')
    new_sys_spec.x0
    disp('identified transmition matrix')
    new_sys_spec.D
    %generation of transformation matrix and transformation
    % only if output is generated!
    
    [new_sys_spec.Ncs,new_sys_spec.Bc]=fourth_step(all_Ai_dashed,all_bi_dashed, new_sys_spec.Ac, id_meth_params, new_sys_spec.n)
    
    [Ac_trans,Bc_trans,C_trans,D_trans,Ncs_trans]=transformation(new_sys_spec,sys_spec,X_all);
    Ac_trans
    C_trans
    Ncs_trans{1}
    
end































 
 
 
 
 
 

 

 
 
 
 
 
 
 
 
 
 
 
 


