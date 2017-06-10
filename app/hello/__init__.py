from flask import render_template
from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('hello.html')

@app.route('/v1/user/<int:user_id>')
def user(user_id):
    return jsonify({
        'id': user_id,
        'name': 'Jhon Doe',
        'email': 'jhon.doe@nowhere.com',
        'last_login': '2017-01-01 12:00:00'
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0')
