%% This is empty, shit!!!!

syms t1 t2 t3 d1 d2 d3 a1 a2 a3

R1 =   [sin(t1)*sin(t3) + cos(t1)*cos(t2)*cos(t3), -cos(t1)*sin(t2), (cos(t1)*cos(t2)*sin(t3) - cos(t3)*sin(t1)), (a1*cos(t1) - d2*sin(t1) + a2*cos(t1)*cos(t2) - d3*cos(t1)*sin(t2) + a3*sin(t1)*sin(t3) + a3*cos(t1)*cos(t2)*cos(t3));
        cos(t2)*cos(t3)*sin(t1) - cos(t1)*sin(t3), -sin(t1)*sin(t2), cos(t1)*cos(t3) + cos(t2)*sin(t1)*sin(t3), d2*cos(t1) + a1*sin(t1) + a2*cos(t2)*sin(t1) - a3*cos(t1)*sin(t3) - d3*sin(t1)*sin(t2) + a3*cos(t2)*cos(t3)*sin(t1);
                         -cos(t3)*sin(t2),         -cos(t2),                          -sin(t2)*sin(t3),                                                                   d1 - d3*cos(t2) - a2*sin(t2) - a3*cos(t3)*sin(t2);
                                        0,                0,                                         0,                                                                                                                   1]

R2 = [0 0 1 0;
      1 0 0 0;
      0 1 0 sym('d0');
      0 0 0 1;
      ]

R3 = [1 0 0 0;
      0 1 0 0;
      0 0 1 sym('d4');
      0 0 0 1;
      ]


Res = R2* R1 * R3

