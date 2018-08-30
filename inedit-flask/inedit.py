from flask import Flask
from flask import render_template
#In order to read the posted values we need to import request from Flask.
from flask import request
from flask import json
from flaskext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash

mysql = MySQL()

app = Flask(__name__)


# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'inedit_db'
#app.config['MYSQL_DATABASE_HOST'] = 'localhost' #default
#app.config['MYSQL_DATABASE_CHARSET'] = 'utf-8' #default
#app.config['MYSQL_DATABASE_PORT'] = '3306' #default
mysql.init_app(app)




#We then use the route() decorator to tell Flask what URL should trigger our function.

@app.route('/hello')
def hello_world():
  return 'Fanis'

@app.route('/')
def main():
    return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')


@app.route('/signUp',methods=['POST','GET'])
def signUp():
    try:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _name and _email and _password:

            # All Good, let's call MySQL
            #cursor = mysql.get_db().cursor()

            conn = mysql.connect()
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            cursor.callproc('p_createUser',(_name,_email,_hashed_password))
            data = cursor.fetchall()

            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()



#check if the executed file is the main program and run the app
if __name__ == "__main__":
    app.run()
