#!/bin/sh
sudo docker start ip-info_maxmind_1

# 0 1,6,14,22 * * * sh geoip_update.sh
# 매일 1시, 6시, 14시, 22시에 실행
