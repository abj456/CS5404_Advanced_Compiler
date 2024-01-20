//test3.c
int main(){
    int i;
    int A[40], B[40], C[40], D[40];
    for (i = 2; i < 4; i++) {
        A[i] = C[i];
        B[2 * i - 3] = D[i + 1];
        D[i] = A[2 * i - 4];
        D[i - 1] = C[2 * i - 1];
    }
    return 0;
}