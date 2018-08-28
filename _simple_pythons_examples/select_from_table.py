import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="pass"
)

mycursor=mydb.cursor()

sql_statement = "SELECT * FROM table"

mycursor.execute(sql_statement)

myresult=mycursor.fetchall()

for x in myresult
  print(x)


