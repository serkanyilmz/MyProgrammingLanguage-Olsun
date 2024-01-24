a 5 olsun,
b 7 olsun,
c 9 olsun,

d a+b olsun,

max a olsun,
a<b ise max b olsun,
b<c ise max c olsun,
max yaz,

c<d ise {
	100 yaz, 
	hold 8 olsun,
}

(a==b ve b<c) ise flagHold17 1 olsun,

(dogru veya yanlis) ise 1 yaz,

x 1 olsun,
sayac 1 olsun,
sayac<5 iken {
	x x*2 olsun, 
	x yaz,
	sayac sayac+1 olsun,
}

yas 19 olsun,
3 kere yas yas+1 olsun,
yas yaz,

yas 19 olsun,
3 kere {
	yas yas+1 olsun,
	yas yaz,
}

bitir.
