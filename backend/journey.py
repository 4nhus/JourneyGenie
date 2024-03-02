from dotenv import load_dotenv
from openai import OpenAI


def get_prompt(latitude: float, longitude: float, weather: str) -> str:
    return f"""I am planning to go to Latitude {latitude}, Longitude {longitude}, the weather will be {weather}.
    Get a 1 day itinerary including times and use real suggestions for places.
    Return me the output in this JSON schema
    {{ 'morning': str[], 'afternoon': str[], 'evening': str[] }}
    """


def get_journey(latitude: float, longitude: float, date: int) -> str:
    load_dotenv()
    client = OpenAI()

    prompt = get_prompt(latitude, longitude, "raining")

    completion = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}]
    )

    return completion.choices[0].message.content


if __name__ == '__main__':
    print(get_journey(33, 151, 1234))
