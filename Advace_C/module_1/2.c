#include <stdio.h>

void rearrangeEvenOdd(int *arr, int size) {
    int *i = arr + 1;

    while (i < arr + size) {
        if (*i % 2 == 0) {
            int val = *i;
            int *j = i;
            while (j > arr && (*(j - 1) % 2 != 0)) {
                *j = *(j - 1); // shift odd elements to the right
                --j;
            }
            *j = val;
        }
        ++i;
    }
}

void printArray(int *arr, int size) {
    int *end = arr + size;
    while (arr < end) {
        printf("%d ", *arr);
        ++arr;
    }
    printf("\n");
}


int main() {
    int arr[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(arr) / sizeof(*arr);

    rearrangeEvenOdd(arr, size);
    printArray(arr, size);

    return 0;
}
