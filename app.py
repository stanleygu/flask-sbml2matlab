from flask import Flask, request
# import tellurium as te
import libsbml

app = Flask(__name__, static_url_path='')

@app.route('/')
def root():
    return app.send_static_file('index.html')


@app.route('/translate', methods=['post'])
def translate():
    data = request.get_json()
    sbml = data.get('sbml')
    doc = libsbml.readSBMLFromString(sbml.encode('utf-8'))
    if doc.getNumErrors() > 0:
        messages = ['Invalid SBML!\n']
        for i in xrange(0, doc.getNumErrors()):
            error = doc.getError(i)
            messages.append(error.getMessage())
        return ''.join(messages)
    else:
        return sbml

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)
