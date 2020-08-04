function y = generate_output_non_constant_input(sys_spec)

x0=zeros(sys_spec.n,1);
x0(5)=1;
x0(4)=0;
x0(2)=0.01;
x0(3)=0;
x0(6)=0;
x0(1)=0;
options=odeset('RelTol',1e-13,'MaxStep',0.001);
u=0.01*ones(sys_spec.r,1);
t_span=0:0.001:1;
%[tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,(sin(tp).*u),sys_spec),t_span,x0,options);
[tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u,sys_spec),t_span,x0,options);
y=[];
for i=1:length(xp)
    %y=[y;sys_spec.C*xp(i,:)'+sys_spec.D*[sin(tp(i)),sin(tp(i))]'];
    %y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*(sin(tp(i)).*u))'];
    y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*(u))'];
end
sys_spec.C
xp(1,:)'
length(y);
length(tp);
length(xp);
y;
plot(tp,y)







end

