%  
%  
% [varargout] = integral_ex(varargin) 
%  
%  
% DESCRIPTION 
% ------------------------------------------------------------------------| 
%  
%  
% INPUTS 
% ------------------------------------------------------------------------| 
%  
%  
% OUTPUTS 
% ------------------------------------------------------------------------| 
%  
%  
% NOTES 
% ------------------------------------------------------------------------| 
%  
%  
% Written 07/01/2013 
% By Sam Thorpe 


function [varargout] = integral_ex(varargin) 


dxA = [0.2 0.1 0.05 0.01 0.001];
D = [0 1];
f = @(x)(x.^2);
adf = @(x)((x.^3)./3);
hrd = D(1):0.001:D(2);


for q = length(dxA):-1:1
    
    dx = dxA(q);
    Dc = D(1):dx:D(2);
    ftc = sum(bsxfun(@times,f(Dc(2:end)),dx));
    adfe = adf(D(2)) - adf(D(1));
    disp('   ');
    disp(['actual antiderivative (x^3/3) evaluated on [0 1]: ',num2str(adfe)]);
    disp(['dx = ',num2str(dx),' integral computed on [0 1]: ',num2str(ftc)]);
    disp(['error = ',num2str(abs(ftc - adfe))]);
    disp('   ');
    
    %                                 PLOTS
    % % ----------------------------------------------------------------------|
    %
    
    figure('position',[2052 361 560 420]);
    hp0 = plot(hrd,f(hrd),'linewidth',2,'color',[0 0 1]);
    hold on;
    hp = plot(Dc,f(Dc),'o','markersize',6,'markerfacecolor',[0 0 1]);
    hold on;
    title(['Integration Example: f(x) = x^2'],'fontsize',17,'fontweight','bold');
    set(gca,'xlim',D,'fontweight','bold');
    grid('on');
    for d = 2:length(Dc)
        hp = patch([Dc(d-1) Dc(d-1) Dc(d) Dc(d)],[0 f(Dc(d)) f(Dc(d)) 0],[0.4 1 0.4]);
        set(hp,'facealpha',0.4,'edgecolor',[0 0.5 0],'edgealpha',1);
    end
    
end


%                              SUBFUNCTIONS 
% % ----------------------------------------------------------------------| 
%  


%                                END ALL 
% % ----------------------------------------------------------------------| 
%  


