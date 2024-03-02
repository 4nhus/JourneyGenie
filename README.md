# JourneyGenie

## Backend
1. Install `venv` using `pip3 install virtualenv`
2. Run `cd backend && python3 -m venv venv`
3. Run `source venv/bin/activate`
4. Run `pip3 install -r requirements.txt`
5. Create a `.env` file and define the OPENAI_API_KEY and WEATHER_API_KEY.
    - We used [OpenAI ](https://platform.openai.com/) for the OPENAI_API_KEY, and [Visual Crossing](https://www.visualcrossing.com/weather-api) for the WEATHER_API_KEY.
    - Add `OPENAI_API_KEY={key}` and `WEATHER_API_KEY={key}` to the `.env` file.
6. Run `python3 -m app`

Then, send requests to `http://127.0.0.1:5000`.

### Adding new libraries to `venv`
1. Run the virtual environment using steps 1-3 above.
2. Run `pip3 install {package_name}`
3. When done, run `pip3 freeze > requirements.txt` 

### Saving OpenAI tokens
1. Go to `journey.py` and modify `lat`, `long` and `time` according to the desired query.
2. Chuck the prompt into ChatGPT.