int array1[] = new int [100];
for (int i = 0; i < 100; ++i)
    array1[i] = i * i;
int array2[] = array1;
array2[0] = 100;

print(array1[99]);