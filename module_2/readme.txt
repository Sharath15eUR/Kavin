1. Use the appropriate command to list all files larger than 1 MB in the current directory and save the output to a file.


kavin@adonis:~/embedUR/module_2$ ls
file1  file2  file3  readme.txt
kavin@adonis:~/embedUR/module_2$ find . -type f -size +1M -ls > large_files.txt
kavin@adonis:~/embedUR/module_2$ cat large_files.txt
  2624458   3072 -rw-rw-r--   1 kavin    kavin     3145728 Jan 28 12:39 ./file2
  2628430   3072 -rw-rw-r--   1 kavin    kavin     3145728 Jan 28 12:39 ./file3
  2628175   3072 -rw-rw-r--   1 kavin    kavin     3145728 Jan 28 12:39 ./file1

=> Here
    => find . -> Start searching from current directory
    => -type f -> Look for regular files only (not directories)
    => -size +1M -> Filter files larger than 1 megabyte
    => -ls -> Show detailed listing (like ls -l)


--------------------------------------------------------------------------------------------------------------------------------------------------------


2. Replace all occurrences of "localhost" with "127.0.0.1" in a configuration file named config.txt, and save the updated file as updated_config.txt.
    
kavin@adonis:~/embedUR/module_2$ cat config.txt
# Database Configuration
db_host=localhost

# API Settings
api_endpoint=http://localhost:8080/api
backup_server=localhost:9000

# Cache Settings
cache_server=localhost:6379
redis_host=localhost
redis_port=6379

# Load Balancer
primary_server=localhost:8081


kavin@adonis:~/embedUR/module_2$ sed 's/localhost/127.0.0.1/g' config.txt > updated_config.txt
kavin@adonis:~/embedUR/module_2$ cat updated_config.txt
# Database Configuration
db_host=127.0.0.1

# API Settings
api_endpoint=http://127.0.0.1:8080/api
backup_server=127.0.0.1:9000

# Cache Settings
cache_server=127.0.0.1:6379
redis_host=127.0.0.1
redis_port=6379

# Load Balancer
primary_server=127.0.0.1:8081



=> Here
    => sed -> Stream editor for filtering and transforming text
    => 's/ -> Start substitution command
    => localhost -> Text to find
    => 127.0.0.1 -> Text to replace with
    => /g' -> Global flag (replace all occurrences in each line)
    => config.txt -> Input file
--------------------------------------------------------------------------------------------------------------------------------------------------------


3.Use the appropriate command to search for lines containing the word "ERROR" in a log file but exclude lines containing "DEBUG". 
  Save the results to a file named filtered_log.txt.

kavin@adonis:~/embedUR/module_2$ grep "ERROR" log.txt | grep -v "DEBUG" > filtered_log.txt
kavin@adonis:~/embedUR/module_2$ cat filtered_log.txt
ERROR: Unable to connect to the database.
ERROR: Failed to fetch data from API endpoint '/users'.
ERROR: Missing required parameter in the request.
ERROR: Assignment Submitted by Kavin :)


=>Here
    => grep "ERROR" log.txt -> Find lines containing "ERROR"
    => | -> Pipe the output to next command
    => grep -v "DEBUG" -> Exclude (-v) lines containing "DEBUG"

--------------------------------------------------------------------------------------------------------------------------------------------------------


4. Write a code to identify the process with the highest memory usage and then terminate it.

kavin@adonis:~/embedUR/module_2$ cat test.sh
#!/bin/bash
# Get PID of process using most memory
pid=$(ps aux --sort=-%mem | awk 'NR==2 {print $2}')
# - ps aux : lists all running processes
# - --sort=-%mem : sorts by memory usage (descending order)
# - awk 'NR==2 {print $2}' : takes the 2nd line (1st is header) and prints 2nd column (PID)

process_name=$(ps aux --sort=-%mem | awk 'NR==2 {print $11}')
mem_usage=$(ps aux --sort=-%mem | awk 'NR==2 {print $4}')

# Print process details
echo "Process with highest memory:"
echo "PID: $pid"
echo "Name: $process_name"
echo "Memory Usage: $mem_usage%"

# Terminate the process
echo "Terminating process..."
kill -15 $pid

# Killing or terminating the process
echo "Process terminated successfully"

kavin@adonis:~/embedUR/module_2$ ./test.sh
Process with highest memory:
PID: 16373
Name: /snap/firefox/5647/usr/lib/firefox/firefox
Memory Usage: 3.0%
Terminating process...
Process terminated successfully

--------------------------------------------------------------------------------------------------------------------------------------------------------

5.Use the networking tool command and print all the gateway available in a sorted manner

kavin@adonis:~/embedUR/module_2$ netstat -rn | grep 'UG' | awk '{print $2}' | sort -n
10.17.0.1
10.17.0.1

=>Here 
  => netstat -rn -> Show routing table (-r) in numeric form (-n)
  => grep 'UG' -> Filter for gateway entries
  => awk '{print $2}' -> Extract gateway addresses
  => sort -n -> Sort numerically