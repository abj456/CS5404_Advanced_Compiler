//test3.c
int main(){
    int i;
    int A[40], B[40], C[40], D[40];
    for (i = 2; i < 20; i++) {
        A[i - 1] = C[2 * i - 1];
        D[i] = A[3 * i - 4];
        D[i + 1] = B[i];
        B[2 * i - 2] = C[i + 1] + D[2 * i - 1]; 
    }
    return 0;
}