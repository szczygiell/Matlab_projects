%uczenie predyktora oe
clear all;
n=0; farx(n+1)=1.165894e+004; foe(n+1)=1.178978e+004; wspucz(n+1)=0.000000e+000; ng(n+1)=0.000000e+000;
n=1; farx(n+1)=8.759008e+003; foe(n+1)=9.039567e+003; krok(n+1)=4.895958e-004; ng(n+1)=4.923494e+003;
n=2; farx(n+1)=4.280663e+003; foe(n+1)=3.430246e+003; krok(n+1)=2.885366e-003; ng(n+1)=2.765620e+003;
n=3; farx(n+1)=3.127064e+003; foe(n+1)=3.227591e+003; krok(n+1)=4.837788e-005; ng(n+1)=6.751276e+003;
n=4; farx(n+1)=3.110278e+003; foe(n+1)=3.084951e+003; krok(n+1)=3.151866e-004; ng(n+1)=2.722068e+003;
n=5; farx(n+1)=2.412109e+003; foe(n+1)=2.932588e+003; krok(n+1)=3.816377e-005; ng(n+1)=6.316260e+003;
n=6; farx(n+1)=2.237925e+003; foe(n+1)=2.796372e+003; krok(n+1)=2.361618e-004; ng(n+1)=2.511724e+003;
n=7; farx(n+1)=1.789454e+003; foe(n+1)=2.660356e+003; krok(n+1)=2.780451e-005; ng(n+1)=6.765647e+003;
n=8; farx(n+1)=1.713479e+003; foe(n+1)=2.543553e+003; krok(n+1)=1.781286e-004; ng(n+1)=3.200760e+003;
n=9; farx(n+1)=1.402945e+003; foe(n+1)=2.423594e+003; krok(n+1)=2.190752e-005; ng(n+1)=7.076981e+003;
n=10; farx(n+1)=1.326652e+003; foe(n+1)=2.326733e+003; krok(n+1)=1.298034e-004; ng(n+1)=3.271489e+003;
n=11; farx(n+1)=1.129845e+003; foe(n+1)=2.230547e+003; krok(n+1)=1.726474e-005; ng(n+1)=7.266461e+003;
n=12; farx(n+1)=1.072979e+003; foe(n+1)=2.145987e+003; krok(n+1)=9.756692e-005; ng(n+1)=3.503181e+003;
n=13; farx(n+1)=9.474574e+002; foe(n+1)=2.076486e+003; krok(n+1)=1.361415e-005; ng(n+1)=7.102353e+003;
n=14; farx(n+1)=9.086962e+002; foe(n+1)=2.020548e+003; krok(n+1)=5.958978e-005; ng(n+1)=3.505226e+003;
n=15; farx(n+1)=8.409719e+002; foe(n+1)=1.979795e+003; krok(n+1)=9.975945e-006; ng(n+1)=6.787725e+003;
n=16; farx(n+1)=8.080732e+002; foe(n+1)=1.928241e+003; krok(n+1)=5.474897e-005; ng(n+1)=3.560527e+003;
n=17; farx(n+1)=7.499929e+002; foe(n+1)=1.888038e+003; krok(n+1)=8.865531e-006; ng(n+1)=7.108539e+003;
n=18; farx(n+1)=7.228259e+002; foe(n+1)=1.840184e+003; krok(n+1)=5.039187e-005; ng(n+1)=3.615393e+003;
n=19; farx(n+1)=6.715517e+002; foe(n+1)=1.800611e+003; krok(n+1)=8.106422e-006; ng(n+1)=7.378562e+003;
n=20; farx(n+1)=6.515142e+002; foe(n+1)=1.758027e+003; krok(n+1)=4.449139e-005; ng(n+1)=3.670811e+003;
n=21; farx(n+1)=6.063492e+002; foe(n+1)=1.720352e+003; krok(n+1)=7.509633e-006; ng(n+1)=7.519374e+003;
n=22; farx(n+1)=5.907840e+002; foe(n+1)=1.681441e+003; krok(n+1)=4.041022e-005; ng(n+1)=3.698950e+003;
n=23; farx(n+1)=5.508039e+002; foe(n+1)=1.645314e+003; krok(n+1)=6.925078e-006; ng(n+1)=7.679312e+003;
n=24; farx(n+1)=5.377523e+002; foe(n+1)=1.608459e+003; krok(n+1)=3.809713e-005; ng(n+1)=3.723152e+003;
n=25; farx(n+1)=5.017660e+002; foe(n+1)=1.573238e+003; krok(n+1)=6.412137e-006; ng(n+1)=7.918719e+003;
n=26; farx(n+1)=4.916984e+002; foe(n+1)=1.539129e+003; krok(n+1)=3.488004e-005; ng(n+1)=3.760614e+003;
n=27; farx(n+1)=4.595629e+002; foe(n+1)=1.505911e+003; krok(n+1)=5.990602e-006; ng(n+1)=8.034107e+003;
n=28; farx(n+1)=4.519636e+002; foe(n+1)=1.474304e+003; krok(n+1)=3.204809e-005; ng(n+1)=3.781852e+003;
n=29; farx(n+1)=4.231477e+002; foe(n+1)=1.443111e+003; krok(n+1)=5.615025e-006; ng(n+1)=8.120804e+003;
n=30; farx(n+1)=4.173708e+002; foe(n+1)=1.413503e+003; krok(n+1)=2.992557e-005; ng(n+1)=3.781782e+003;
n=31; farx(n+1)=3.913053e+002; foe(n+1)=1.384024e+003; krok(n+1)=5.269152e-006; ng(n+1)=8.250227e+003;
n=32; farx(n+1)=3.869671e+002; foe(n+1)=1.356162e+003; krok(n+1)=2.793956e-005; ng(n+1)=3.763004e+003;
n=33; farx(n+1)=3.635250e+002; foe(n+1)=1.328738e+003; krok(n+1)=4.944182e-006; ng(n+1)=8.301773e+003;
n=34; farx(n+1)=3.600620e+002; foe(n+1)=1.302049e+003; krok(n+1)=2.697415e-005; ng(n+1)=3.744082e+003;
n=35; farx(n+1)=3.385673e+002; foe(n+1)=1.275896e+003; krok(n+1)=4.641652e-006; ng(n+1)=8.454756e+003;
n=36; farx(n+1)=3.362497e+002; foe(n+1)=1.251147e+003; krok(n+1)=2.518354e-005; ng(n+1)=3.735382e+003;
n=37; farx(n+1)=3.168683e+002; foe(n+1)=1.227119e+003; krok(n+1)=4.373484e-006; ng(n+1)=8.430233e+003;
n=38; farx(n+1)=3.154318e+002; foe(n+1)=1.204120e+003; krok(n+1)=2.382783e-005; ng(n+1)=3.713312e+003;
n=39; farx(n+1)=2.978447e+002; foe(n+1)=1.181911e+003; krok(n+1)=4.122797e-006; ng(n+1)=8.408332e+003;
n=40; farx(n+1)=2.969769e+002; foe(n+1)=1.160208e+003; krok(n+1)=2.307378e-005; ng(n+1)=3.665040e+003;
n=41; farx(n+1)=2.808140e+002; foe(n+1)=1.139483e+003; krok(n+1)=3.907906e-006; ng(n+1)=8.402956e+003;
n=42; farx(n+1)=2.807142e+002; foe(n+1)=1.119687e+003; krok(n+1)=2.139878e-005; ng(n+1)=3.610503e+003;
n=43; farx(n+1)=2.661664e+002; foe(n+1)=1.101279e+003; krok(n+1)=3.744041e-006; ng(n+1)=8.153029e+003;
n=44; farx(n+1)=2.667688e+002; foe(n+1)=1.083265e+003; krok(n+1)=2.044242e-005; ng(n+1)=3.553002e+003;
n=45; farx(n+1)=2.533059e+002; foe(n+1)=1.066154e+003; krok(n+1)=3.578487e-006; ng(n+1)=8.065447e+003;
n=46; farx(n+1)=2.543066e+002; foe(n+1)=1.049255e+003; krok(n+1)=2.018691e-005; ng(n+1)=3.471179e+003;
n=47; farx(n+1)=2.416560e+002; foe(n+1)=1.033089e+003; krok(n+1)=3.433397e-006; ng(n+1)=8.022122e+003;
n=48; farx(n+1)=2.430926e+002; foe(n+1)=1.017569e+003; krok(n+1)=1.931492e-005; ng(n+1)=3.383690e+003;
n=49; farx(n+1)=2.313972e+002; foe(n+1)=1.002875e+003; krok(n+1)=3.323139e-006; ng(n+1)=7.800337e+003;
n=50; farx(n+1)=2.332411e+002; foe(n+1)=9.887397e+002; krok(n+1)=1.846630e-005; ng(n+1)=3.296689e+003;
n=51; farx(n+1)=2.223562e+002; foe(n+1)=9.753444e+002; krok(n+1)=3.231488e-006; ng(n+1)=7.575401e+003;
n=52; farx(n+1)=2.245611e+002; foe(n+1)=9.625720e+002; krok(n+1)=1.755604e-005; ng(n+1)=3.220947e+003;
n=53; farx(n+1)=2.144320e+002; foe(n+1)=9.504083e+002; krok(n+1)=3.150286e-006; ng(n+1)=7.327784e+003;
n=54; farx(n+1)=2.168790e+002; foe(n+1)=9.386669e+002; krok(n+1)=1.707914e-005; ng(n+1)=3.141839e+003;
n=55; farx(n+1)=2.073381e+002; foe(n+1)=9.274100e+002; krok(n+1)=3.068738e-006; ng(n+1)=7.149181e+003;
n=56; farx(n+1)=2.099029e+002; foe(n+1)=9.164394e+002; krok(n+1)=1.675917e-005; ng(n+1)=3.053593e+003;
n=57; farx(n+1)=2.008926e+002; foe(n+1)=9.060694e+002; krok(n+1)=3.006731e-006; ng(n+1)=6.946195e+003;
n=58; farx(n+1)=2.036212e+002; foe(n+1)=8.960610e+002; krok(n+1)=1.611741e-005; ng(n+1)=2.968029e+003;
n=59; farx(n+1)=1.951388e+002; foe(n+1)=8.865961e+002; krok(n+1)=2.956550e-006; ng(n+1)=6.704087e+003;
n=60; farx(n+1)=1.980001e+002; foe(n+1)=8.774078e+002; krok(n+1)=1.568168e-005; ng(n+1)=2.880429e+003;
n=61; farx(n+1)=1.899312e+002; foe(n+1)=8.686373e+002; krok(n+1)=2.908621e-006; ng(n+1)=6.512322e+003;
n=62; farx(n+1)=1.928883e+002; foe(n+1)=8.601522e+002; krok(n+1)=1.535151e-005; ng(n+1)=2.791255e+003;
n=63; farx(n+1)=1.851690e+002; foe(n+1)=8.519720e+002; krok(n+1)=2.865922e-006; ng(n+1)=6.339655e+003;
n=64; farx(n+1)=1.881686e+002; foe(n+1)=8.441274e+002; krok(n+1)=1.490654e-005; ng(n+1)=2.702414e+003;
n=65; farx(n+1)=1.808290e+002; foe(n+1)=8.365821e+002; krok(n+1)=2.829751e-006; ng(n+1)=6.128282e+003;
n=66; farx(n+1)=1.838651e+002; foe(n+1)=8.292381e+002; krok(n+1)=1.476011e-005; ng(n+1)=2.637422e+003;
n=67; farx(n+1)=1.767847e+002; foe(n+1)=8.221111e+002; krok(n+1)=2.789484e-006; ng(n+1)=5.993232e+003;
n=68; farx(n+1)=1.798034e+002; foe(n+1)=8.151957e+002; krok(n+1)=1.453926e-005; ng(n+1)=2.581776e+003;
n=69; farx(n+1)=1.730015e+002; foe(n+1)=8.085334e+002; krok(n+1)=2.759993e-006; ng(n+1)=5.824393e+003;
n=70; farx(n+1)=1.760043e+002; foe(n+1)=8.020771e+002; krok(n+1)=1.416371e-005; ng(n+1)=2.527700e+003;
n=71; farx(n+1)=1.694787e+002; foe(n+1)=7.958737e+002; krok(n+1)=2.737094e-006; ng(n+1)=5.644085e+003;
n=72; farx(n+1)=1.724602e+002; foe(n+1)=7.898557e+002; krok(n+1)=1.373458e-005; ng(n+1)=2.478858e+003;
n=73; farx(n+1)=1.661919e+002; foe(n+1)=7.840747e+002; krok(n+1)=2.719073e-006; ng(n+1)=5.467742e+003;
n=74; farx(n+1)=1.691704e+002; foe(n+1)=7.784719e+002; krok(n+1)=1.334530e-005; ng(n+1)=2.432185e+003;
n=75; farx(n+1)=1.631161e+002; foe(n+1)=7.730218e+002; krok(n+1)=2.696520e-006; ng(n+1)=5.327972e+003;
n=76; farx(n+1)=1.660785e+002; foe(n+1)=7.677283e+002; krok(n+1)=1.314101e-005; ng(n+1)=2.385001e+003;
n=77; farx(n+1)=1.602023e+002; foe(n+1)=7.625234e+002; krok(n+1)=2.664567e-006; ng(n+1)=5.230276e+003;
n=78; farx(n+1)=1.631140e+002; foe(n+1)=7.573976e+002; krok(n+1)=1.318762e-005; ng(n+1)=2.335225e+003;
n=79; farx(n+1)=1.573632e+002; foe(n+1)=7.523728e+002; krok(n+1)=2.636469e-006; ng(n+1)=5.170420e+003;
n=80; farx(n+1)=1.602454e+002; foe(n+1)=7.474863e+002; krok(n+1)=1.302585e-005; ng(n+1)=2.289495e+003;
n=81; farx(n+1)=1.546389e+002; foe(n+1)=7.426599e+002; krok(n+1)=2.610198e-006; ng(n+1)=5.094914e+003;
n=82; farx(n+1)=1.574522e+002; foe(n+1)=7.379701e+002; krok(n+1)=1.277945e-005; ng(n+1)=2.244700e+003;
n=83; farx(n+1)=1.520240e+002; foe(n+1)=7.333918e+002; krok(n+1)=2.591838e-006; ng(n+1)=4.984222e+003;
n=84; farx(n+1)=1.548014e+002; foe(n+1)=7.289123e+002; krok(n+1)=1.254943e-005; ng(n+1)=2.203247e+003;
n=85; farx(n+1)=1.495126e+002; foe(n+1)=7.245191e+002; krok(n+1)=2.570868e-006; ng(n+1)=4.905048e+003;
n=86; farx(n+1)=1.522667e+002; foe(n+1)=7.202233e+002; krok(n+1)=1.240203e-005; ng(n+1)=2.163912e+003;
n=87; farx(n+1)=1.470925e+002; foe(n+1)=7.159627e+002; krok(n+1)=2.542898e-006; ng(n+1)=4.853996e+003;
n=88; farx(n+1)=1.498028e+002; foe(n+1)=7.117725e+002; krok(n+1)=1.240203e-005; ng(n+1)=2.138604e+003;
n=89; farx(n+1)=1.447217e+002; foe(n+1)=7.076176e+002; krok(n+1)=2.516317e-006; ng(n+1)=4.817112e+003;
n=90; farx(n+1)=1.473798e+002; foe(n+1)=7.035519e+002; krok(n+1)=1.225575e-005; ng(n+1)=2.119938e+003;
n=91; farx(n+1)=1.424116e+002; foe(n+1)=6.995424e+002; krok(n+1)=2.499886e-006; ng(n+1)=4.752111e+003;
n=92; farx(n+1)=1.450384e+002; foe(n+1)=6.956640e+002; krok(n+1)=1.191391e-005; ng(n+1)=2.108668e+003;
n=93; farx(n+1)=1.402251e+002; foe(n+1)=6.918168e+002; krok(n+1)=2.472091e-006; ng(n+1)=4.672044e+003;
n=94; farx(n+1)=1.428153e+002; foe(n+1)=6.879390e+002; krok(n+1)=1.222055e-005; ng(n+1)=2.093746e+003;
n=95; farx(n+1)=1.380434e+002; foe(n+1)=6.840920e+002; krok(n+1)=2.429186e-006; ng(n+1)=4.700684e+003;
n=96; farx(n+1)=1.405953e+002; foe(n+1)=6.801655e+002; krok(n+1)=1.270754e-005; ng(n+1)=2.077140e+003;
n=97; farx(n+1)=1.358153e+002; foe(n+1)=6.762753e+002; krok(n+1)=2.394612e-006; ng(n+1)=4.765878e+003;
n=98; farx(n+1)=1.383358e+002; foe(n+1)=6.724423e+002; krok(n+1)=1.265721e-005; ng(n+1)=2.069906e+003;
n=99; farx(n+1)=1.336382e+002; foe(n+1)=6.686310e+002; krok(n+1)=2.369137e-006; ng(n+1)=4.746875e+003;
n=100; farx(n+1)=1.361162e+002; foe(n+1)=6.648840e+002; krok(n+1)=1.255575e-005; ng(n+1)=2.062929e+003;
n=101; farx(n+1)=1.315098e+002; foe(n+1)=6.611730e+002; krok(n+1)=2.349982e-006; ng(n+1)=4.710993e+003;
n=102; farx(n+1)=1.339547e+002; foe(n+1)=6.575616e+002; krok(n+1)=1.226836e-005; ng(n+1)=2.060279e+003;
n=103; farx(n+1)=1.294643e+002; foe(n+1)=6.539789e+002; krok(n+1)=2.332047e-006; ng(n+1)=4.652297e+003;
n=104; farx(n+1)=1.318524e+002; foe(n+1)=6.504702e+002; krok(n+1)=1.197415e-005; ng(n+1)=2.055304e+003;
n=105; farx(n+1)=1.274910e+002; foe(n+1)=6.470389e+002; krok(n+1)=2.320038e-006; ng(n+1)=4.572858e+003;
n=106; farx(n+1)=1.298628e+002; foe(n+1)=6.436617e+002; krok(n+1)=1.171829e-005; ng(n+1)=2.053018e+003;
n=107; farx(n+1)=1.255929e+002; foe(n+1)=6.403239e+002; krok(n+1)=2.301869e-006; ng(n+1)=4.532309e+003;
n=108; farx(n+1)=1.279482e+002; foe(n+1)=6.370361e+002; krok(n+1)=1.161317e-005; ng(n+1)=2.047428e+003;
n=109; farx(n+1)=1.237461e+002; foe(n+1)=6.337561e+002; krok(n+1)=2.279840e-006; ng(n+1)=4.516627e+003;
n=110; farx(n+1)=1.260613e+002; foe(n+1)=6.305341e+002; krok(n+1)=1.148323e-005; ng(n+1)=2.039797e+003;
n=111; farx(n+1)=1.219467e+002; foe(n+1)=6.273411e+002; krok(n+1)=2.262292e-006; ng(n+1)=4.476962e+003;
n=112; farx(n+1)=1.242450e+002; foe(n+1)=6.241987e+002; krok(n+1)=1.138585e-005; ng(n+1)=2.033445e+003;
n=113; farx(n+1)=1.201877e+002; foe(n+1)=6.210589e+002; krok(n+1)=2.245085e-006; ng(n+1)=4.461811e+003;
n=114; farx(n+1)=1.224532e+002; foe(n+1)=6.180207e+002; krok(n+1)=1.109569e-005; ng(n+1)=2.029421e+003;
n=115; farx(n+1)=1.184963e+002; foe(n+1)=6.149891e+002; krok(n+1)=2.233016e-006; ng(n+1)=4.400904e+003;
n=116; farx(n+1)=1.206997e+002; foe(n+1)=6.120450e+002; krok(n+1)=1.069939e-005; ng(n+1)=2.024846e+003;
n=117; farx(n+1)=1.168720e+002; foe(n+1)=6.091703e+002; krok(n+1)=2.233016e-006; ng(n+1)=4.296011e+003;
n=118; farx(n+1)=1.190711e+002; foe(n+1)=6.063723e+002; krok(n+1)=1.031748e-005; ng(n+1)=2.026367e+003;
n=119; farx(n+1)=1.153398e+002; foe(n+1)=6.035878e+002; krok(n+1)=2.216561e-006; ng(n+1)=4.242197e+003;
n=120; farx(n+1)=1.175104e+002; foe(n+1)=6.008198e+002; krok(n+1)=1.031835e-005; ng(n+1)=2.016120e+003;
n=121; farx(n+1)=1.138262e+002; foe(n+1)=5.980740e+002; krok(n+1)=2.199796e-006; ng(n+1)=4.231366e+003;
n=122; farx(n+1)=1.159738e+002; foe(n+1)=5.953768e+002; krok(n+1)=1.015759e-005; ng(n+1)=2.010911e+003;
n=123; farx(n+1)=1.123592e+002; foe(n+1)=5.926944e+002; krok(n+1)=2.184616e-006; ng(n+1)=4.197614e+003;
n=124; farx(n+1)=1.144909e+002; foe(n+1)=5.900515e+002; krok(n+1)=1.009346e-005; ng(n+1)=2.004247e+003;
n=125; farx(n+1)=1.109384e+002; foe(n+1)=5.874060e+002; krok(n+1)=2.158092e-006; ng(n+1)=4.186160e+003;
n=126; farx(n+1)=1.130426e+002; foe(n+1)=5.847338e+002; krok(n+1)=1.034570e-005; ng(n+1)=1.988429e+003;
n=127; farx(n+1)=1.095168e+002; foe(n+1)=5.820781e+002; krok(n+1)=2.125074e-006; ng(n+1)=4.216615e+003;
n=128; farx(n+1)=1.116214e+002; foe(n+1)=5.793544e+002; krok(n+1)=1.083629e-005; ng(n+1)=1.970415e+003;
n=129; farx(n+1)=1.080522e+002; foe(n+1)=5.766159e+002; krok(n+1)=2.094646e-006; ng(n+1)=4.310221e+003;
n=130; farx(n+1)=1.101395e+002; foe(n+1)=5.739326e+002; krok(n+1)=1.083629e-005; ng(n+1)=1.961136e+003;
n=131; farx(n+1)=1.066179e+002; foe(n+1)=5.712214e+002; krok(n+1)=2.071929e-006; ng(n+1)=4.307416e+003;
n=132; farx(n+1)=1.086329e+002; foe(n+1)=5.685483e+002; krok(n+1)=1.069939e-005; ng(n+1)=1.948853e+003;
n=133; farx(n+1)=1.052161e+002; foe(n+1)=5.659477e+002; krok(n+1)=2.061399e-006; ng(n+1)=4.230115e+003;
n=134; farx(n+1)=1.072594e+002; foe(n+1)=5.633319e+002; krok(n+1)=1.083629e-005; ng(n+1)=1.941257e+003;
n=135; farx(n+1)=1.038243e+002; foe(n+1)=5.606846e+002; krok(n+1)=2.037798e-006; ng(n+1)=4.291401e+003;
n=136; farx(n+1)=1.058275e+002; foe(n+1)=5.581302e+002; krok(n+1)=1.061240e-005; ng(n+1)=1.933843e+003;
n=137; farx(n+1)=1.024988e+002; foe(n+1)=5.555733e+002; krok(n+1)=2.014676e-006; ng(n+1)=4.229918e+003;
n=138; farx(n+1)=1.044859e+002; foe(n+1)=5.529458e+002; krok(n+1)=1.113124e-005; ng(n+1)=1.913567e+003;
n=139; farx(n+1)=1.011342e+002; foe(n+1)=5.503238e+002; krok(n+1)=1.985021e-006; ng(n+1)=4.307327e+003;
n=140; farx(n+1)=1.030738e+002; foe(n+1)=5.476963e+002; krok(n+1)=1.115447e-005; ng(n+1)=1.899826e+003;
n=141; farx(n+1)=9.978177e+001; foe(n+1)=5.451311e+002; krok(n+1)=1.971685e-006; ng(n+1)=4.275587e+003;
n=142; farx(n+1)=1.017198e+002; foe(n+1)=5.425790e+002; krok(n+1)=1.106017e-005; ng(n+1)=1.892973e+003;
n=143; farx(n+1)=9.846696e+001; foe(n+1)=5.400389e+002; krok(n+1)=1.953953e-006; ng(n+1)=4.271234e+003;
n=144; farx(n+1)=1.003751e+002; foe(n+1)=5.375319e+002; krok(n+1)=1.095389e-005; ng(n+1)=1.883328e+003;
n=145; farx(n+1)=9.718433e+001; foe(n+1)=5.350499e+002; krok(n+1)=1.940233e-006; ng(n+1)=4.236094e+003;
n=146; farx(n+1)=9.909298e+001; foe(n+1)=5.325986e+002; krok(n+1)=1.095376e-005; ng(n+1)=1.874791e+003;
n=147; farx(n+1)=9.593946e+001; foe(n+1)=5.301227e+002; krok(n+1)=1.913452e-006; ng(n+1)=4.247869e+003;
n=148; farx(n+1)=9.782433e+001; foe(n+1)=5.276111e+002; krok(n+1)=1.138585e-005; ng(n+1)=1.855447e+003;
n=149; farx(n+1)=9.466018e+001; foe(n+1)=5.250982e+002; krok(n+1)=1.893963e-006; ng(n+1)=4.302895e+003;
n=150; farx(n+1)=9.650786e+001; foe(n+1)=5.226594e+002; krok(n+1)=1.109774e-005; ng(n+1)=1.847779e+003;

figure; semilogy(farx,'b'); hold on; semilogy(foe,'r'); xlabel('Iteracje'); ylabel('Earx, Eoe'); legend('Earx','Eoe'); title('Uczenie predyktora OE');
print (['zmiany_bledow2.png' ], '-dpng', '-r400')
figure; subplot(2,1,1); semilogy(krok); xlabel('Iteracje'); ylabel('Krok');
subplot(2,1,2); semilogy(ng); xlabel('Iteracje'); ylabel('Norma gradientu');
Earx=farx(n+1)
Eoe=foe(n+1)
