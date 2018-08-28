import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="nikos69fanis!"
)

mycursor=mydb.cursor()

mycursor.execute("CREATE DATABASE inedit_db")
