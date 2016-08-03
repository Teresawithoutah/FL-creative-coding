// Perlin's INoise from http://mrl.nyu.edu/~perlin/noise/
// Adapted for Processing and compared against Processings InBuilt Noise Function
// BP170208


// Copyright 2002 Ken Perlin
// FIXED POINT VERSION OF IMPROVED NOISE:  1.0 IS REPRESENTED BY 2^16

   static int inoise(int x, int y, int z) {
      int X = x>>16 & 255, Y = y>>16 & 255, Z = z>>16 & 255, N = 1<<16;
      x &= N-1; y &= N-1; z &= N-1;
      int u=fade(x),v=fade(y),w=fade(z), A=p[X  ]+Y, AA=p[A]+Z, AB=p[A+1]+Z,
                                         B=p[X+1]+Y, BA=p[B]+Z, BB=p[B+1]+Z;
      return lerp(w, lerp(v, lerp(u, grad(p[AA  ], x   , y   , z   ),  
                                     grad(p[BA  ], x-N , y   , z   )), 
                             lerp(u, grad(p[AB  ], x   , y-N , z   ),  
                                     grad(p[BB  ], x-N , y-N , z   ))),
                     lerp(v, lerp(u, grad(p[AA+1], x   , y   , z-N ),  
                                     grad(p[BA+1], x-N , y   , z-N )), 
                             lerp(u, grad(p[AB+1], x   , y-N , z-N ),
                                     grad(p[BB+1], x-N , y-N , z-N ))));
   }
   static int lerp(int t, int a, int b) { return a + (t * (b - a) >> 12); }
   static int grad(int hash, int x, int y, int z) {
      int h = hash&15, u = h<8?x:y, v = h<4?y:h==12||h==14?x:z;
      return ((h&1) == 0 ? u : -u) + ((h&2) == 0 ? v : -v);
   }
    static int fade(int t) {
      int t0 = fade[t >> 8], t1 = fade[Math.min(255, (t >> 8) + 1)];
      return t0 + ( (t & 255) * (t1 - t0) >> 8 );
   }
   static int fade[] = new int[256];
   static double f(double t) { return t * t * t * (t * (t * 6 - 15) + 10); }

static final int p[] = new int[512], permutation[] = { 151,160,137,91,90,15,
   131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23,
   190, 6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33,
   88,237,149,56,87,174,20,125,136,171,168, 68,175,74,165,71,134,139,48,27,166,
   77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244,
   102,143,54, 65,25,63,161, 1,216,80,73,209,76,132,187,208, 89,18,169,200,196,
   135,130,116,188,159,86,164,100,109,198,173,186, 3,64,52,217,226,250,124,123,
   5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42,
   223,183,170,213,119,248,152, 2,44,154,163, 70,221,153,101,155,167, 43,172,9,
   129,22,39,253, 19,98,108,110,79,113,224,232,178,185, 112,104,218,246,97,228,
   251,34,242,193,238,210,144,12,191,179,162,241, 81,51,145,235,249,14,239,107,
   49,192,214, 31,181,199,106,157,184, 84,204,176,115,121,50,45,127, 4,150,254,
   138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180
   };

// inoise_setup must be called before calling the noise functions for the first time
//
void inoise_setup()
{
  for (int i=0; i < 256 ; i++) p[256+i] = p[i] = permutation[i];
  for (int i=0; i < 256 ; i++) fade[i] = (int)((1<<12)*f(i/256.));
}

static final int mult = 1<<16;

// inoisef
//
// returns a noise value at supplied floating point co-ordinates
// range is [-1, 1]
float inoisef(float x, float y, float z)
{
  return (float)(inoise((int)(mult*x),(int)(mult*y),(int)(mult*z))) / mult;
}

// inoisef2
//
// returns a noise value at supplied floating point co-ordinates
// range is [0, 1] to mimic the behaviour of the internal processing noise function
float inoisef2(float x, float y, float z)
{
  return (1 + ((float)(inoise((int)(mult*x),(int)(mult*y),(int)(mult*z))) / mult)) / 2.0f;
}

// fractalsum
//
// returns summed noise function over supplied octaves
float fractalSum(float x, float y, float z, int nOctaves, float falloff) {
  float sum = inoisef(x, y, z); // first octave
  float oct = 2.0;
  for (int i = 2; i < nOctaves; ++i) {
    sum += (inoisef( x * oct, y * oct, z * oct) * falloff);
    falloff /= 2.0;
    oct *= 2.0;
  }
  return sum;
}
    
// turbulence
//
// returns abs summed noise function over supplied octaves
float turbulence(float x, float y, float z, int nOctaves, float falloff) {
  float sum = abs(inoisef(x, y, z)); // first octave
  float oct = 2.0;
  for (int i = 2; i < nOctaves; ++i) {
    sum += (abs(inoisef( x * oct, y * oct, z * oct)) * falloff);
    falloff /= 2.0;
    oct *= 2.0;
  }
  return sum;
}
