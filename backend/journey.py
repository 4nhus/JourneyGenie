from dotenv import load_dotenv
from openai import OpenAI
from weather import get_weather_str

def get_prompt(latitude: float, longitude: float, weather: str) -> str:
    # return f"""I am planning to go to Latitude {latitude}, Longitude {longitude}, the weather will be {weather}.
    # Get a 1 day itinerary including times and use real suggestions for places.
    # Return me the output in this JSON schema
    #  {{ 'morning': [{{"start": string, "end": string, description: "string"}}], 'afternoon':  [{{"start": string, "end": string, description: "string"}}], 'evening':  [{{"start": string, "end": string, description: "string"}}] }}
    # """

    return f"""I am planning to go to a place located near latitude {latitude} and longitude {longitude}. Please plan me a descriptive one-day itinerary using real suggestions for locations to go, including the times. Please also account for the weather, as it will be {weather}. 
    Return me the output in this JSON schema
     {{ 'morning': [{{"start": string, "end": string, description: "string"}}], 'afternoon':  [{{"start": string, "end": string, description: "string"}}], 'evening':  [{{"start": string, "end": string, description: "string"}}] }}
    """


def get_journey(latitude: float, longitude: float, date: int) -> str:
    load_dotenv()
    client = OpenAI()

    prompt = get_prompt(latitude, longitude, get_weather_str(latitude, longitude, date))
    
    # debugging logs
    print('prompt: ')
    print(prompt)

    completion = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}]
    )

    return completion.choices[0].message.content

if __name__ == '__main__':
    lat = 11.8688
    long = 120.2093
    time = 	1709665387
    print(get_prompt(lat, long, get_weather_str(lat, long, time)))
