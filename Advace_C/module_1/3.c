#include <stdio.h>
#include <stdbool.h>

bool searchMatrix(int n, int matrix[n][n], int key) {
    int row = 0;
    int col = n - 1;

    while (row < n && col >= 0) {
        if (matrix[row][col] == key) {
            return true;
        } else if (matrix[row][col] > key) {
            col--; // move left
        } else {
            row++; // move down
        }
    }
    return false;
}


int main() {
    int matrix[4][4] = {
        {1, 4, 7, 11},
        {2, 5, 8, 12},
        {3, 6, 9, 16},
        {10, 13, 14, 17}
    };
    int key = 11;

    if (searchMatrix(4, matrix, key)) {
        printf("Key %d found in matrix.\n", key);
    } else {
        printf("Key %d not found in matrix.\n", key);
    }

    return 0;
}
