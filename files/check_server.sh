#!/bin/bash

LOG_FILE="/var/log/keepalived-check.log"
PORT=8000
ROOT_DIR="/home/wrcs/server"

# Проверка порта
if ! nc -z localhost $PORT; then
    echo "$(date): Порт $PORT недоступен" >> $LOG_FILE
    exit 1
fi

# Проверка файла
if [ ! -f "$ROOT_DIR/index.html" ]; then
    echo "$(date): Файл $ROOT_DIR/index.html не найден" >> $LOG_FILE
    exit 1
fi

echo "$(date): Проверка пройдена" >> $LOG_FILE
exit 0
