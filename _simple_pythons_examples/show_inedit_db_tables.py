import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="nikos69fanis!",
  database="inedit_db"
)

mycursor=mydb.cursor()

mycursor.execute("SHOW TABLES")

for x in mycursor:
  print(x)
