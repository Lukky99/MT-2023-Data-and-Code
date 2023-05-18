xi = ap_complete(9:36)
x = xi+1.5
y = nu_SNR(9:36)


f=fit(x,y,'poly4')
plot(f,x,y)
hold
plot(x, y)



y1n=nu_SNR/norm(nu_SNR);
y2n=nu_ALM/norm(nu_ALM);
normratio=norm(nu_SNR)/norm(nu_ALM);
c=conv2(y1n,y2n,'same');
[val ind]=max(c);