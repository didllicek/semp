function [y,X,U] = generate_output_data(r,id_meth_params,sys_spec)

%rewrite to be genereal
points=1+id_meth_params.l0+id_meth_params.s*(id_meth_params.p+1)*(id_meth_params.l+1)
input=zeros(r,points);

%idxs1=[1,7,10,13,16];
%idxs2=[1,7,10,13,16,19,22,25,28];
    j=1;
    U=[];
    for i=1:id_meth_params.s
        if(j==1)
            input(:,j)=id_meth_params.W(:,i);
            U=[U,id_meth_params.W(:,i)];
            j=j+id_meth_params.l0+1;
        end
        for k=1:id_meth_params.p+1
            input(:,j)=id_meth_params.W(:,i);
            U=[U,id_meth_params.W(:,i)];
            j=j+id_meth_params.l+1;
        end
    end
            
%input(1,idxs1)=1;
%input(2,idxs2)=1;
%U=input(:,idxs2);
input

x0=sys_spec.x0;
X=[];
t=0:id_meth_params.delta_t:(points*id_meth_params.delta_t);
y=zeros(sys_spec.m,points);
options=odeset('AbsTol',1e-18,'MaxStep',id_meth_params.delta_t/1000);
for i=1:points
    u=input(:,i);
    t_span=[t(i),t(i+1)];
    [tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u,sys_spec),t_span,x0,options);
    y(1:sys_spec.m,i)=(sys_spec.C)*x0+sys_spec.D*u;
    X=[X;x0];
    x0;
    x0=xp(end,:)';

end

%y(1:sys_spec.m,points)=(sys_spec.C)*x0%+sys_spec.D*u;
length(1:points);
length(y(1,:));
length(input);


for i=1:id_meth_params.m
    figure(i)
    plot(0:points-1,y(i,:),'r-')
    %figure(r+i)
    %plot(0:points-1,input(i,:),'y-')
end

y=reshape(y,[sys_spec.m*points,1]);

end