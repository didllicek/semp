function [ x_0, D ] = third_part(y,all_Ai_dashed,all_bi_dashed,x_1,U,C,id_meth_params,X)
    D=[];
    D2=[];
    D1=[y(1:id_meth_params.m)];
    x_0=all_Ai_dashed{1}\(x_1-all_bi_dashed{1});
    X;
    X=[x_0,X];
    id_meth_params.p;
    np=(id_meth_params.s*(id_meth_params.p+1)-1);
    for i=(id_meth_params.m*(id_meth_params.l0+1)+1):id_meth_params.m*(id_meth_params.l+1):(id_meth_params.m*(id_meth_params.l0+1)+1)+np*id_meth_params.m*(id_meth_params.l+1)
         D1=[D1, y(i:i+id_meth_params.m-1)];    
    end
    
    for i=1:length(X)
        D2=[D2,D1(:,i)-C*X(:,i)]; 
    end
    
    D=D2/U;
    
    
    
    
    
    
    






end

