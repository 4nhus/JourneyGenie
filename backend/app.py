from flask import Flask, request, jsonify
import json
from journey import get_journey

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello, World!'

# Uncomment the get_journey call and comment the with open() block to actually use openAI api.
@app.route('/api/v1/journey', methods=['POST'])
def journey():
    data = request.json
    print(data)
    latitude = data.get('latitude')
    longitude = data.get('longitude')
    date = data.get('date')

    print(f"Lat: {latitude} Long: {longitude} Date: {date}")

    with open("sample_journey.txt") as f:
        return jsonify(json.loads(f.read()))

    # res = get_journey(latitude, longitude, date)
    # print(res)
    # return res


if __name__ == '__main__':
    app.run(debug=True)
