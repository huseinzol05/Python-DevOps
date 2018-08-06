from flask import Flask, request
from elasticsearch import Elasticsearch
app = Flask(__name__)
es = Elasticsearch([{'host': 'localhost', 'port': 9200}])

@app.route('/')
def hello_world():
    return 'Hey, we have Flask with Elastic Search in a Docker container!'

@app.route('/ping')
def ping():
    global es
    if es.ping():
        return 'connected to elastic search'
    else:
        es = Elasticsearch([{'host': 'localhost', 'port': 9200}])
        return 'cannot connect to elastic search, reconnecting..'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0',port=5000)
