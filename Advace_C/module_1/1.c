#include <stdio.h>
#include <string.h>

struct Day {
    char dayName[20]; 
    char tasks[3][100]; // Array of strings for tasks (max 3 tasks per day)
    int numTasks;       // Number of tasks currently stored for the day
};

int main() {

    struct Day week[7];

    strcpy(week[0].dayName, "Sunday");
    strcpy(week[1].dayName, "Monday");
    strcpy(week[2].dayName, "Tuesday");
    strcpy(week[3].dayName, "Wednesday");
    strcpy(week[4].dayName, "Thursday");
    strcpy(week[5].dayName, "Friday");
    strcpy(week[6].dayName, "Saturday");

    
    for (int i = 0; i < 7; i++) {
        week[i].numTasks = 0;
    }

    int choice;
    char dayInput[20];
    char taskInput[100];
    int dayIndex = -1; // To store the index of the chosen day

    do {
        printf("\n--- Weekly Calendar Program ---\n");
        printf("1. Add tasks for a day\n");
        printf("2. Display all tasks\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        while (getchar() != '\n'); 

        switch (choice) {
            case 1:
                printf("Enter the day (e.g., Monday): ");
                fgets(dayInput, sizeof(dayInput), stdin);
                // Remove the trailing newline character
                dayInput[strcspn(dayInput, "\n")] = '\0'; 

                dayIndex = -1; // Reset dayIndex for each input attempt
                for (int i = 0; i < 7; i++) {
                    // Compare case-insensitively
                    if (strcasecmp(week[i].dayName, dayInput) == 0) { 
                        dayIndex = i;
                        break;
                    }
                }

                if (dayIndex != -1) {
                    if (week[dayIndex].numTasks < 3) {
                        printf("Enter task %d for %s: ", week[dayIndex].numTasks + 1, week[dayIndex].dayName);
                        fgets(taskInput, sizeof(taskInput), stdin);
                        
                        taskInput[strcspn(taskInput, "\n")] = '\0'; 
                        
                        strcpy(week[dayIndex].tasks[week[dayIndex].numTasks], taskInput);
                        week[dayIndex].numTasks++;
                        printf("Task added successfully!\n");
                    } else {
                        printf("Maximum 3 tasks already added for %s. Cannot add more.\n", week[dayIndex].dayName);
                    }
                } else {
                    printf("Invalid day entered. Please try again.\n");
                }
                break;

            case 2:
                printf("\n--- All Tasks Grouped by Day ---\n");
                for (int i = 0; i < 7; i++) {
                    printf("\n%s:\n", week[i].dayName);
                    if (week[i].numTasks == 0) {
                        printf("  No tasks for today.\n");
                    } else {
                        for (int j = 0; j < week[i].numTasks; j++) {
                            printf("  - %s\n", week[i].tasks[j]);
                        }
                    }
                }
                break;

            case 3:
                printf("Exiting program\n");
                break;

            default:
                printf("Invalid choice. Please enter a valid option\n");
                break;
        }
    } while (choice != 3);

    return 0;
}