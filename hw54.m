%% 4a
a = 0;
b = 1;
h = 0.25;
N = (b-a)/h;
t = a:h:b;
y(1) = 1;
for i=1:N
    f = (2-2*t(i)*y(i)) / (t(i)^2 + 1);
    k1 = (2-2*t(i+1)*(y(i)+h*f)) / (t(i+1)^2 + 1);
    y(i+1) = y(i) + (h/2)*(f+k1);
end
plot(t, y, 'DisplayName', 'modified euler');
hold on
yexact(1)=1;
for i=1:N+1
    yexact(i)=(2*t(i)+1)/(t(i)^2 + 1);
end
plot(t, yexact, 'DisplayName', 'exact solution');
title('Homework 5.4 code');
xlabel('0<t<1');
ylabel('y');


%% Midpoint Method
ym(1) = 1;
for i=1:N
    f = (2-2*t(i)*ym(i)) / (t(i)^2 + 1);
    c = t(i) + h/2;
    d = y(i) + (h/2) * f;
    g = (2-2*c*d) / (c^2 + 1);
    ym(i+1) = ym(i)+h*g;
end
plot(t, ym, 'DisplayName','midpoint');
%% Runge-Kutta order 4
yr(1) = 1;
for i=1:N
    f = (2-2*t(i)*yr(i)) / (t(i)^2 + 1);
    c = t(i) + h/2;
    d = yr(i) + (1/2) * k1;
    k1 = h*f;
    k2 = h*(2-2*c*d) / (c^2 + 1);
    e = yr(i) + (1/2) * k2;
    k3 = h*(2-2*c*e) / (c^2 + 1);
    w = yr(i)+k3;
    k4 = h * (2-2*t(i+1)*w) / (t(i+1)^2 + 1);

    yr(i+1) = yr(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end
plot(t, yr, 'DisplayName','runge-kutta')
legend
hold off
    






