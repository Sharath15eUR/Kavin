#include <signal.h>
#include <sys/time.h>
#include <string.h>

volatile sig_atomic_t keepRunning = 1;

void handle_sigint(int sig) {
    printf("\nCaught SIGINT! Ignoring Ctrl+C...\n");
    keepRunning = 0;
}

void* threadB_func(void* arg) {
    for (int i = 0; i < 50 && keepRunning; i++) {
        printf("Thread 1 running\n");
        sleep(2);
    }
    return NULL;
}

void* threadC_func(void* arg) {
    for (int i = 0; i < 34 && keepRunning; i++) {
        printf("Thread 2 running\n");
        sleep(3);
    }
    return NULL;
}

int main() {
    signal(SIGINT, handle_sigint);

    int N;
    printf("Enter value of N: ");
    scanf("%d", &N);

    struct timeval start, end;
    gettimeofday(&start, NULL);

    pthread_t threadA, threadB, threadC;

    pthread_create(&threadA, NULL, threadA_func, &N);
    pthread_create(&threadB, NULL, threadB_func, NULL);
    pthread_create(&threadC, NULL, threadC_func, NULL);

    pthread_join(threadA, NULL);
    pthread_join(threadB, NULL);
    pthread_join(threadC, NULL);

    gettimeofday(&end, NULL);
    double elapsed = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1e6;
    printf("Total time taken: %.2f seconds\n", elapsed);

    return 0;
}
