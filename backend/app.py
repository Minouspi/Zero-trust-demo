from flask import Flask, request, abort

app = Flask(__name__)

@app.route("/data")
def data():
    token = request.headers.get("Authorization")
    if token != "Bearer SECRET123":
        abort(403)
    return "Sensitive data"

app.run(host="0.0.0.0", port=5000)
