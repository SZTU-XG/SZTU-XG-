%--------------------------------------------------------------------------

%   初始化

%--------------------------------------------------------------------------

clear;clc;



%--------------------------------------------------------------------------

%   参数设置

%--------------------------------------------------------------------------

N = 3.3*10^8;                                                               %人口总数（美国）

E = 0;                                                                      %潜伏者

I = 1;                                                                      %传染者

S = N - I;                                                                  %易感者

R = 0;                                                                      %康复者

D = 0;                                                                      %每日死亡人数

Dt = 0;                                                                     %总死亡人数


d = 1.5*10^(-5);                                                            %死亡率

r =round(rand(1,1)*50);                                                    %感染者接触易感者的人数（0-50随机分布的一个数）

B = 0.03;                                                                   %传染概率

a = 0.1;                                                                    %潜伏者转化为感染者概率

r2 =round(rand(1,1)*50);                                                    %潜伏者接触易感者的人数（0-50随机分布的一个数）

B2 = 0.03;                                                                  %潜伏者传染正常人的概率

y = 0.0075;                                                                 %康复概率

o = 0.8;                                                            %外出概率                         


T = 1:300;

for idx = 1:length(T)-1
    
    S(idx+1) = S(idx) - r*o*B*S(idx)*I(idx)/N(1) - r2*o*B2*S(idx)*E(idx)/N;

    E(idx+1) = E(idx) + r*B*o*S(idx)*I(idx)/N(1)-a*E(idx) + r2*o*B2*S(idx)*E(idx)/N;

    I(idx+1) = I(idx) + a*E(idx) - y*I(idx) -d * I(idx);

    R(idx+1) = R(idx) + y*I(idx);

    D(idx+1) = d * I(idx);

    Dt(idx+1) = Dt(idx) + D(idx);

end



plot(T,S,T,E,T,I,T,R,T,D,T,Dt);grid on;

hold on

xlabel('天');ylabel('人数')

legend('易感者','潜伏者','传染者','康复者','死亡者','总死亡人数')

title('戒严措施对SEIR模型的影响')