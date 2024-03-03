import urllib3
from dataclasses import dataclass
from dotenv import load_dotenv
import json
import os

BASE_URL = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline'

@dataclass
class WeatherConfig:
    apiKey: str
    unitGroup: str
    location: str
    date: str
    include: str

def generate_url(config: WeatherConfig) -> str:
    return f"{BASE_URL}/{config.location}/{config.date}?unitGroup={config.unitGroup}&include={config.include}&key={config.apiKey}"

def get_weather_str(latitude: float, longitude: float, date: int) -> str:
    load_dotenv()
    apiKey = os.getenv('WEATHER_API_KEY')
    weatherConfig = WeatherConfig(
        apiKey,
        unitGroup='metric',
        location=f"{latitude},{longitude}",
        date=str(date),
        include='daily'
    )

    url = generate_url(weatherConfig)
    http = urllib3.PoolManager()
    response = http.request('GET', url)
    if (response.status != 200):
        print('weather api failed')
        exit(1)

    result = json.loads(response.data.decode('utf-8'))

    # logging
    print('weather api response: ')
    print(json.dumps(result, indent=4))

    return result['days'][0]['description'].strip(". ").lower()
