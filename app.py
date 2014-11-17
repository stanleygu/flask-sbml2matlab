from flask import Flask, request

app = Flask(__name__, static_url_path='')


@app.route('/')
def root():
    return app.send_static_file('index.html')


@app.route('/translate', methods=['post'])
def translate():
    data = request.get_json()
    sbml = data.get('sbml')
    return sbml

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
