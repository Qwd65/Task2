import psycopg2
from psycopg2 import sql
import time

#time.sleep(10)

# Подключение к базе данных
conn = psycopg2.connect(
    dbname="postgres",
    user="postgres",
    password="password",
    host="db",
    port="5432"
)

# Создание таблицы и добавление данных
with conn.cursor() as cursor:
    # Создание таблицы
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS employees (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        age int NOT NULL,
        position VARCHAR(100) NOT NULL
    )
    """)
    
    # Наполнение таблицы данными
    #cursor.execute("DELETE FROM employees")  # Очистка таблицы перед вставкой данных
    cursor.execute("""
    INSERT INTO employees (name,age, position)
    VALUES
        ('Alice Smith', 33 , 'Engineer'),
        ('Bob Johnson', 24 ,'Manager'),
        ('Charlie Brown', 53 ,'Developer')
    """)
    
    # Вывод данных из таблицы
    cursor.execute("SELECT * FROM employees")
    rows = cursor.fetchall()
    for row in rows:
        id, name, age, position = row
        print(f"Id: {id}, Name: {name}, Age: {age}, Department: {position}")

# Закрытие соединения с базой данных
conn.commit()
conn.close()
