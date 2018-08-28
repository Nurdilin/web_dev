from flask import Flask
app = Flask(__name__)

#We then use the route() decorator to tell Flask what URL should trigger our function.
@app.route('/hello')
def hello_world():
  return 'Hello from Flask!'

if __name__ == '__main__':
  app.run()
