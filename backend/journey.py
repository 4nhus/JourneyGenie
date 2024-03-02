from dotenv import load_dotenv
from openai import OpenAI
from weather import get_weather_str

def get_prompt(latitude: float, longitude: float, weather: str) -> str:
    return f"""I am planning to go to Latitude {latitude}, Longitude {longitude}, the weather will be {weather}.
    Get a 1 day itinerary including times and use real suggestions for places.
    Return me the output in this JSON schema
     {{ 'morning': [{{"start": string, "end": string, description: "string"}}], 'afternoon':  [{{"start": string, "end": string, description: "string"}}], 'evening':  [{{"start": string, "end": string, description: "string"}}] }}
    """

def get_journey(latitude: float, longitude: float, date: int) -> str:
    load_dotenv()
    client = OpenAI()

    prompt = get_prompt(latitude, longitude, get_weather_str(latitude, longitude, date))

    completion = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}]
    )

    return completion.choices[0].message.content


if __name__ == '__main__':
    print(get_prompt(33, 151, 'partly cloudy throughout the day with a chance of rain'))
#    print(get_journey(33, 151, 1710179980))
