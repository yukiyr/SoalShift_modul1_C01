#!/bin/bash

awk '/cron/ || /CRON/,!/sudo/' /var/log/syslog | awk 'NF < 13 {print}' >> /home/test/modl1/logsoal5.log

#crontab = 2-30/6 * * * * /bin/bash /home/test/soal5.sh
