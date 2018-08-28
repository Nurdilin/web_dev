import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="pass"
)

mycursor=mydb.cursor()

mycursor.execute("CREATE DATABASE inedit_db")
