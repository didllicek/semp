function [c,new_sys_spec]=test1(dir,criterion)
    [Ac,Bc,C,D,Ncs,sys_spec,new_sys_spec]=bilinear_system_identification_juang(dir);
    %observability matrix of the system
    Ob=obsv(sys_spec.Ac,sys_spec.C);
    % Number of unobservable states
    unob = length(sys_spec.Ac)-rank(Ob)
    % for what period, delta_t and how many points test?
    u=2*rand(new_sys_spec.r,1);
    %eig(Ac+Ncs{1});
    %Ac+Ncs{1};
    %Ac;
    new_sys_spec.Ac;
    eig(new_sys_spec.Ac+new_sys_spec.Ncs{1});
    %controllability of the system
    Co = ctrb(sys_spec.Ac,sys_spec.Bc);
    % Number of uncontrollable states
    unco = length(sys_spec.Ac) - rank(Co);
    %u(1)=1;
    %u(2)=1;
    y_original_system=generate_output_non_constant_input(sys_spec);
    y_new_io_equivalent_system=generate_output_non_constant_input(new_sys_spec);
    figure(2)
    plot(1:1:length(y_original_system),y_original_system,'r*')
    hold on
    %plot(0:1:10,y_original_system(1:100:1001),'r*')
    %plot(0:0.01:10,y_new_io_equivalent_system,'b-')
    plot(1:1:length(y_new_io_equivalent_system),y_new_io_equivalent_system,'b-')
    %plot(1:length(y_new_io_equivalent_system),y_new_io_equivalent_system,'b*')
    %legend('original','original-sapmling points','identified','identified-sampling points')
    xlabel('time [s]') 
    ylabel('y')
    
    
    
    c=norm( y_original_system- y_new_io_equivalent_system);  
    if(c<criterion)
        disp(strcat('Test-', dir ,' passed!'))
    else
        disp(strcat('Test-', dir ,' did NOT pass!'))
    end
