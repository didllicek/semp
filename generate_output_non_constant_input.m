function y = generate_output_non_constant_input(sys_spec)

x0=sys_spec.x0;
options=odeset('RelTol',1e-10,'MaxStep',0.0001); 
u=15*ones(sys_spec.r,1);%0.01*ones(sys_spec.r,1);
%u(1)=1;
t_span=0:0.00005:0.5;
[tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,(sin(tp).*u),sys_spec),t_span,x0,options);
%[tp,xp]=ode45(@(tp,xp)dynamic_system(tp,xp,u,sys_spec),t_span,x0,options);
y=[];
for i=1:length(xp)
   % y=[y;sys_spec.C*xp(i,:)'+sys_spec.D*(sin(tp(i)).*u)];
    y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*(sin(tp(i))*u))'];
    %y=[y;(sys_spec.C*xp(i,:)'+sys_spec.D*u)'];
end
disp('important')
%sys_spec.D
%sys_spec.C
%sys_spec.D*(sin(tp(1))*u)
sys_spec.C*xp(1,:)'
sys_spec.D
u
sys_spec.D*u
%sys_spec.D*(sin(tp(1))*u)+sys_spec.C*xp(1,:)'
sys_spec.D*u+sys_spec.C*xp(1,:)'
y(1,:)'
length(y);
length(tp);
length(xp);
y;
%plot(tp,y);







end

