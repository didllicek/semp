function [Ac_at,Bc_at,C_at,D_at,Ncs_at]=transformation(new_sys_spec,sys_spec,X)
    
    %generate transformation matrix
    Q_vawe=[new_sys_spec.C];
    Q=[sys_spec.C];
    for i=2:new_sys_spec.n
        Q_vawe=[Q_vawe;new_sys_spec.C*new_sys_spec.Ac^(new_sys_spec.n-1)];
        Q=[Q;sys_spec.C*sys_spec.Ac^(new_sys_spec.n-1)];
    end
    phi=Q\Q_vawe
    X=reshape(X,new_sys_spec.n,[]); %new
    X_trans=[];
    for i=1:length(X)
        X_trans=[X_trans;phi\X(:,i)];
    end
    
    X_trans;
    
    %transformation of identified system
    Ac_at=(phi*new_sys_spec.Ac)/phi
    Bc_at=phi*new_sys_spec.Bc
    C_at=new_sys_spec.C/phi
    D_at=new_sys_spec.D
    Ncs_at=cell(1,sys_spec.r);
    for i=1:sys_spec.r
        Nci=new_sys_spec.Ncs{i};
        Ncs_at{i}=(phi*Nci)/phi;
        disp('Ncs_at')
       (phi*Nci)/phi
        %Ncs(1:n,((i-1)*n+1):i*n)=(phi*Ncs_bt(1:n,((i-1)*n+1):i*n))/phi;
        %i=i+1;
    end
    
end