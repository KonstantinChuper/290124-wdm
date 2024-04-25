#!/bin/bash
address="google.com"
max_ping_time=1
max_failures=3
failures=0

while true; do
 ping_result=$(ping -c 1 "$address" | grep 'icmp_seq')
 ping_time=$(echo "$ping_result" | awk -F'=' '{print $4}' | awk '{print $1}')

if [ "$ping_time" > "$max_ping_time" ]; then
echo "Пинг превышает $max_ping_time мс"
fi

 if [ -z "$ping_time" ]; then
 echo "Пинг $address не удался."
 ((failures++))
 else
 echo "Пинг $address успешен: $ping_time мс."
 failures=0
 fi

 if [ "$failures" -ge "$max_failures" ]; then
 echo "Превышено максимальное количество неудачных попыток."
 failures=0
 fi

 sleep 1
done