//test4.c
int main(){
    int i;
    int A[8092], B[8092], C[8092];
    for (i = 0; i < 25; i++) {
        A[119 * i] = C[23 * i + 3];
        B[100 * i] = C[i + 2000];
        C[100 * i + 23] = B[i + 1];
        C[23 * i] = A[289 * i];
    }
    return 0;
}