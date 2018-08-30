import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="nikosfanis!dumpPassforGit"
)

mycursor=mydb.cursor()

sql_statement = "INSERT INTO customers (name, address) VALUES (%s, %s)"
values = ("John", "Highway 21")

mycursor.execute(sql_statement, values)

mydb.commit()

print(mycursor.rowcount, "record(s) inserted.")


