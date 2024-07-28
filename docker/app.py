from flask import Flask, jsonify
import boto3
from datetime import datetime

app = Flask(__name__)

def get_unaccounted_materials():
    return [
        {"order_id": 1, "material": "Steel", "quantity": 50, "date": datetime.now().strftime("%Y-%m-%d")},
        {"order_id": 2, "material": "Copper", "quantity": 30, "date": datetime.now().strftime("%Y-%m-%d")}
    ]

@app.route('/report', methods=['GET'])
def report():
    data = get_unaccounted_materials()
    return jsonify(data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
