mkdir -p /obligatorio/prueba
mkdir -p /obligatorio/usuario1
mkdir -p /obligatorio/usuario2
mkdir -p /obligatorio/usuario2/personal
mkdir -p /obligatorio/usuario3

echo prueba1 > /obligatorio/prueba/arch1
echo prueba2 > /obligatorio/prueba/arch2
echo prueba3 > /obligatorio/usuario1/arch3
echo prueba4 > /obligatorio/usuario1/arch4
echo prueba5 > /obligatorio/usuario1/arch5
echo prueba6 > /obligatorio/usuario2/arch6
echo prueba7 > /obligatorio/usuario2/arch7
echo prueba8 > /obligatorio/usuario2/arch8
echo prueba9 > /obligatorio/usuario3/arch9
echo prueba10 > /obligatorio/usuario3/arch10
echo prueba11 > /obligatorio/usuario3/arch11
echo prueba12 > /obligatorio/usuario2/personal/arch12
echo prueba13 > /obligatorio/usuario2/personal/arch13
echo prueba14 > /obligatorio/usuario2/personal/arch14

useradd -m prueba
useradd -m usuario1
useradd -m usuario2
useradd -m usuario3
useradd -m usuario4
useradd -m usuario5
useradd -m usuario6

groupadd grupo1
groupadd grupo2
groupadd grupo3

usermod -G grupo1 usuario1
usermod -G grupo2 usuario2
usermod -G grupo3 usuario3
usermod -G grupo3 usuario4
usermod -G grupo2 usuario5
usermod -G grupo3 usuario6

chmod 600 /obligatorio/prueba/arch1
chmod 660 /obligatorio/prueba/arch2
chmod 640 /obligatorio/usuario1/arch3
chmod 640 /obligatorio/usuario1/arch4
chmod 440 /obligatorio/usuario1/arch5
chmod 400 /obligatorio/usuario2/arch6
chmod 400 /obligatorio/usuario2/arch7
chmod 400 /obligatorio/usuario2/arch8
chmod 606 /obligatorio/usuario3/arch9
chmod 606 /obligatorio/usuario3/arch10
chmod 400 /obligatorio/usuario3/arch11
chmod 600  /obligatorio/usuario2/personal/arch12
chmod 604 /obligatorio/usuario2/personal/arch13
chmod 606 /obligatorio/usuario2/personal/arch14

chgrp grupo1 [ /obligatorio/usuario1/arch5 /obligatorio/usuario2/arch7 /obligatorio/usuario3/arch9 /obligatorio/usuario2/personal/arch13 /obligatorio/usuario2/personal/arch12 ]
chgrp grupo2 [ /obligatorio/prueba/arch2 /obligatorio/usuario1/arch4 ]
chgrp grupo3 [ /obligatorio/usuario3/arch10 /obligatorio/usuario2/personal/arch14 /obligatorio/prueba/arch1 /obligatorio/usuario1/arch3 ]

chown -R prueba /obligatorio/prueba/
chown -R usuario1 /obligatorio/usuario1/
chown -R usuario2 /obligatorio/usuario2/
chown -R usuario3 /obligatorio/usuario3/