kavin@adonis:~/embedUR/module_3$ touch backup_manager.sh
kavin@adonis:~/embedUR/module_3$ nano backup_manager.sh
kavin@adonis:~/embedUR/module_3$ nano backup_manager.sh
kavin@adonis:~/embedUR/module_3$ chmod +x backup_manager.sh
kavin@adonis:~/embedUR/module_3$ mkdir source
kavin@adonis:~/embedUR/module_3$ mkdir backup
kavin@adonis:~/embedUR/module_3$ cd source/
kavin@adonis:~/embedUR/module_3/source$ ls
document.pdf  file1.txt  file2.txt  file3.txt
kavin@adonis:~/embedUR/module_3/source$ cd ..
kavin@adonis:~/embedUR/module_3$ ./backup_manager.sh ./source ./backup .txt
Backup directory './backup' does not exist. Creating it...
Backing up: file1.txt (15 bytes)
Backing up: file2.txt (15 bytes)
Backing up: file3.txt (26 bytes)
Backup completed. Report saved to ./backup/backup_report.log.
kavin@adonis:~/embedUR/module_3$ cat backup/backup_report.log
Backup Report - Tue Jan 28 08:21:58 PM IST 2025
----------------------------
Total files processed: 3
Total size of files backed up: 56 bytes
Backup directory: ./backup
Files backed up:
file1.txt
file2.txt
file3.txt

kavin@adonis:~/embedUR/module_3$ ./backup_manager.sh ./source ./backup .pdf
Backing up: document.pdf (16 bytes)
Backup completed. Report saved to ./backup/backup_report.log.
kavin@adonis:~/embedUR/module_3$ cat backup/backup_report.log
Backup Report - Tue Jan 28 08:22:43 PM IST 2025
----------------------------
Total files processed: 1
Total size of files backed up: 16 bytes
Backup directory: ./backup
Files backed up:
document.pdf
kavin@adonis:~/embedUR/module_3$


