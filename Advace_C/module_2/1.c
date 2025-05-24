#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

// Prime check function
int is_prime(int num) {
    if (num < 2) return 0;
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return 0;
    }
    return 1;
}

// Thread A - Sum of first N primes
void* threadA_func(void* arg) {
    int N = *((int*)arg);
    int count = 0, num = 2, sum = 0;
    while (count < N) {
        if (is_prime(num)) {
            sum += num;
            count++;
        }
        num++;
    }
    printf("Sum of first %d primes: %d\n", N, sum);
    return NULL;
}

// Thread B - Every 2 seconds
void* threadB_func(void* arg) {
    for (int i = 0; i < 50; i++) {
        printf("Thread 1 running\n");
        sleep(2);
    }
    return NULL;
}

// Thread C - Every 3 seconds
void* threadC_func(void* arg) {
    for (int i = 0; i < 34; i++) {
        printf("Thread 2 running\n");
        sleep(3);
    }
    return NULL;
}

int main() {
    int N;
    printf("Enter value of N: ");
    scanf("%d", &N);

    pthread_t threadA, threadB, threadC;

    pthread_create(&threadA, NULL, threadA_func, &N);
    pthread_create(&threadB, NULL, threadB_func, NULL);
    pthread_create(&threadC, NULL, threadC_func, NULL);

    pthread_join(threadA, NULL);
    pthread_join(threadB, NULL);
    pthread_join(threadC, NULL);

    return 0;
}
