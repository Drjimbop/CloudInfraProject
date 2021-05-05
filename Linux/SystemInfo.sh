#!/bin/bash

du -h > ~/Projects/backups/diskuse/disk_use.txt

free -h > ~/Projects/backups/freemem/free_mem.txt

df -h > ~/Projects/backups/freedisk/free_disk.txt

lsof > ~/Projects/backups/openlist/open_list.txt
