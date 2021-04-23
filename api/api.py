import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>My first helm update</h1><p>This is an updated api-response.</p>"

app.run()