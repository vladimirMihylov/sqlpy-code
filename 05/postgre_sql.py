import psycopg2

def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        DROP TABLE clients;
        DROP TABLE phones;            
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS clients(
            client_id SERIAL UNIQUE PRIMARY KEY,
            first_name VARCHAR(40) NOT NULL,
            last_name VARCHAR(40) NOT NULL,
            email VARCHAR(40)
        );
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS phones(
            id SERIAL PRIMARY KEY,
            client_id INTEGER REFERENCES clients(id),
            phone VARCHAR(12)
        );
        """)
        conn.commit()

def add_client(conn, client_id, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
        INSERT INTO clients(client_id, first_name, last_name, email) VALUES(%s, %s, %s, %s);
        """, (client_id, first_name, last_name, email))
        conn.commit()
        cur.execute("""
        SELECT * 
        FROM clients;
        """)
        print(cur.fetchall())
        cur.execute("""
        INSERT INTO phones(client_id, phone) VALUES(%s, %s);
        """, (client_id, phones))
        conn.commit()
        cur.execute("""
        SELECT * 
        FROM phones;
        """)
        print(cur.fetchall())

def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
        UPDATE phones SET phone=%s WHERE client_id=%s;
        """, (phone, client_id))
        cur.execute("""
        SELECT * 
        FROM phones;
        """)
        print(cur.fetchall())

def change_client(conn, client_id, first_name=None, last_name=None, email=None, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
        UPDATE clients SET first_name=%s, last_name=%s, email=%s WHERE client_id=%s;
        """, (first_name, last_name, email, client_id))
        cur.execute("""
        SELECT * 
        FROM clients;
        """)
        print(cur.fetchall())
        cur.execute("""
        UPDATE phones SET phone=%s WHERE client_id=%s;
        """, (phones, client_id))
        cur.execute("""
        SELECT * 
        FROM phones;
        """)
        print(cur.fetchall())

def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
        UPDATE phones SET phone=%s WHERE client_id=%s;
        """, ('Null', client_id))
        cur.execute("""
        SELECT * 
        FROM phones;
        """)
        print(cur.fetchall())

def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phones WHERE client_id=%s;
        """, (client_id,))
        cur.execute("""
        SELECT * 
        FROM phones;
        """)
        print(cur.fetchall())
        cur.execute("""
        DELETE FROM clients WHERE client_id=%s;
        """, (client_id,))
        cur.execute("""
        SELECT * 
        FROM clients;
        """)
        print(cur.fetchall())

def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        cur.execute("""
        SELECT * 
        FROM clients 
        JOIN phones ON clients.client_id = phones.client_id 
        WHERE first_name=%s 
        OR last_name=%s 
        OR email=%s 
        OR phones.phone=%s;
        """, (first_name, last_name, email, phone))
        print(cur.fetchall())


with psycopg2.connect(database="clients_db", user="postgres", password="postgres") as conn:
    with conn.cursor() as cur:
        create_db(conn)
        add_client(conn, 1, 'Иван', 'Иванов', 'ivanov.ivan@mail.ru', '+79009009090')
        add_client(conn, 2, 'Андрей', 'Андреев', 'andrew.andreev@mail.ru')
        add_phone(conn, 2, '+78008008080')
        change_client(conn, 1, 'Иван', 'Иванов', 'i.ivanov@bk.ru', '+79009009090')
        delete_phone(conn, 1, '+79009009090')
        delete_client(conn, 2)
        find_client(conn, last_name='Иванов')
        find_client(conn, email='i.ivanov@bk.ru')
    
conn.close()
