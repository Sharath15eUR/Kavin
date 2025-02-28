avin@adonis:~/embedUR/module_5$ mkdir -p logs/sub
kavin@adonis:~/embedUR/module_5$ echo "This is a error message" > logs/error.log
kavin@adonis:~/embedUR/module_5$ echo "Another error" > logs/sub/debug.log
kavin@adonis:~/embedUR/module_5$ echo "TODO:  Fix this later" > script.sh
kavin@adonis:~/embedUR/module_5$ echo "No errors here " > logs/info.log
kavin@adonis:~/embedUR/module_5$
kavin@adonis:~/embedUR/module_5$ ls
logs  readme.txt  script.sh
kavin@adonis:~/embedUR/module_5$ nano file_analyser.sh
kavin@adonis:~/embedUR/module_5$ chmod 777 file_analyser.sh
kavin@adonis:~/embedUR/module_5$ ./file_analyser.sh -d logs -k error
Found keyword in: logs/error.log
Found keyword in: logs/info.log
Found keyword in: logs/sub/debug.log
kavin@adonis:~/embedUR/module_5$ ./file_analyser.sh -f script.sh -k TODO
Found keyword in: script.sh
kavin@adonis:~/embedUR/module_5$ ./file_analyser.sh --help
File Analyzer - Search for keywords in files

Usage:
    ./file_analyser.sh -d <directory> -k <keyword>    Search for keyword in directory
    ./file_analyser.sh -f <file> -k <keyword>        Search for keyword in specific file
    ./file_analyser.sh --help                        Display this help menu

Options:
    -d <directory>    Directory to search recursively
    -k <keyword>      Keyword to search for
    -f <file>        Specific file to search
    --help           Show this help message
kavin@adonis:~/embedUR/module_5$ ^C
kavin@adonis:~/embedUR/module_5$
kavin@adonis:~/embedUR/module_5$ ./file_analyser.sh --debug -d logs -k error
Script name: ./file_analyser.sh
Number of arguments: 5
All arguments received: --debug -d logs -k error
Exit status of last command: 0
kavin@adonis:~/embedUR/module_5$