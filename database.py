import mysql.connector

class MySQLDataBase:
    _instance = None

    def __new__(cls):
        if(cls._instance is None):
            cls._instance = super(MySQLDataBase, cls).__new__(cls)
            cls._instance.connection = mysql.connector.connect(
                host = 'localhost',
                user = 'root',
                password = 'admin',
                database = 'SA_T3'
            )
        return cls._instance
    
    def get_connection(self):
        return self.connection
    
    def close_connection(self):
        self.connection.close()
