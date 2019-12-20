function [c,f] = MohrCircleFittingFun(sigmal1,sigmal3)
%MOHRCIRCLEFITTINGFUN calculate the C and φ of the mohr circle.
%  强度参数
% sigmal1
% sigmal3

% 计算圆心和半径
C=[(sigmal3+sigmal1)/2,zeros(length(sigmal1),1)];
R=abs(sigmal3-sigmal1)/2;

% 最小二乘法拟合
dist=@(t,C)abs(C(:,3)-abs(t(1).*C(:,1)-C(:,2)+t(2))./sqrt(1+t(1).^2));
options = optimoptions('lsqcurvefit','Display','off');
[X,~]=lsqcurvefit(dist,[0.1,0],[C,R],zeros(size(C,1),1));

c=X(2);
f=atan(X(1))/pi*180;
end

