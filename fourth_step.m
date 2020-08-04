function [ Ncs,Bc ] = fourth_step( all_Ai_dashed, all_bi_dashed, Ac, id_meth_params,n)
    A=[]
    for i=1:id_meth_params.s
        A=[A,logm(all_Ai_dashed{i})/id_meth_params.delta_t-Ac];        
    end
    W=kron(id_meth_params.W,eye(n));
    Nc=A/W;
    for i=1:id_meth_params.r
        Ncs{i}=Nc(:,(i-1)*n+1:i*n);
    end
    
    
    B=[];
    
    
    for i=1:id_meth_params.s
        coef=eye(n)*(id_meth_params.delta_t); 
            for j=2:40               % how to set end of cycle, why 20?
                coef=coef+((Ac+Nc*kron(id_meth_params.W(:,i),eye(n)))^(j-1)*(id_meth_params.delta_t)^j)/factorial(j);
            end
        bci=(coef\all_bi_dashed{i});
        B=[B,bci];
    end
    
    Bc=B/id_meth_params.W;
    
    

    
    
    
     


end

