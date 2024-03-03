from flask import Flask, request, jsonify
import json
from journey import get_journey

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello, World!'

@app.route('/api/v1/journey', methods=['POST'])
def journey():
    data = request.json
    print(data)
    latitude = data.get('latitude')
    longitude = data.get('longitude')
    date = data.get('date')

    # logging
    print(f"Lat: {latitude} Long: {longitude} Date: {date}")

    res = get_journey(latitude, longitude, date)
    print(res)
    return res


if __name__ == '__main__':
    app.run(debug=True)
