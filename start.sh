#!/bin/bash
cd alise_1
export PORT=5000
unset PIP_USER

# Create venv if not exists
if [ ! -d "venv" ]; then
    echo "Создание виртуального окружения..."
    python3 -m venv venv --system-site-packages
fi

# Activate
source venv/bin/activate

# Try install (might fail if pip is broken, but packages should be there from packager_tool)
if [ -f "requirements.txt" ]; then
    echo "Проверка библиотек..."
    # We skip pip install if it fails, assuming packager_tool handled it
    pip install -r requirements.txt || echo "Error, Error, Help Me."
fi

echo "Запуск приложения..."
python main.py