function  [all_Ai_dashed,all_bi_dashed,X] = second_part(y,A,U1_up,x_l0,id_meth_params)
    all_Ai_dashed={};
    all_bi_dashed={};
    Y1=[];
    X1=[[x_l0;1]];
    X=[];
    disp('Second part')
    k=id_meth_params.l0+2;
    m=id_meth_params.m;
    y;
    for j=1:id_meth_params.s
        for i=k*m+1:m*(id_meth_params.l+1):k*m+id_meth_params.p*(id_meth_params.l+1)*m+1
            i
            %j=i
            %id_meth_params.l
            hki=y(i:(i+(id_meth_params.alpha-1)*m-1))
            X1=[X1,[A^(id_meth_params.l)*(U1_up\hki);1]];
            %(U1_up\y(j:(j+(id_meth_params.alpha-1)*m-1)))
            Y1=[Y1,(U1_up\hki)];%(1+i*(m-1):i*m,i)=hki;
        end
        if(j<=id_meth_params.s)
            x_to_next_cycle=X1(:,end);
        end
        X1=X1(:,1:end-1)
        X=[X,X1(1:end-1,:)];
        rank(X1)
        rank(X1);
        pinv(X1);   
        Y1
        Aib_dashed=Y1*X1'*inv(X1*X1');
        Ai_dashed=Aib_dashed(:,1:end-1);
        bi_dashed=Aib_dashed(:,end);
        all_Ai_dashed{j}= Ai_dashed;
        all_bi_dashed{j}= bi_dashed;
        X1=[ x_to_next_cycle];
        Y1=[];
        k=(i-1+(id_meth_params.l+1)*m)/m
    end
      
        
end