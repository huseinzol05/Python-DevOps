from flask import Flask, request
from werkzeug import secure_filename
import os
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = os.getcwd()

@app.route('/')
def hello_world():
    return 'Hey, we have Flask in a Docker container!'

@app.route('/file', methods = ['POST'])
def members():
    f = request.files['file']
    f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
    return f.filename

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0',port=5000)
