# JourneyGenie

JourneyGenie is a tool designed to take the stress and uncertainty out of your next holiday. 

It helps travelers plan their next holiday by leveraging the latest AI technology to analyse a vast database of travel reviews, articles, and recommendations to suggest the best locations, attractions, restaurants, and accommodations tailored to the user's preferences. 

Most importantly, the model will be supplemented with forecasted weather data to accurately suggest the most appropriate activities, ensuring that your itinerary is tailored to the prevailing weather conditions for an enjoyable and seamless travel experience.


## Developement
### Backend

In the backend directory

1. Run `python3 -m venv venv`
2. Run `source venv/bin/activate`
3. Run `pip3 install -r requirements.txt`
4. Create a `.env` file and define the OPENAI_API_KEY and WEATHER_API_KEY.
    - We used [OpenAI ](https://platform.openai.com/) for the OPENAI_API_KEY, and [Visual Crossing](https://www.visualcrossing.com/weather-api) for the WEATHER_API_KEY.
    - Add `OPENAI_API_KEY={key}` and `WEATHER_API_KEY={key}` to the `.env` file.
5. Run `python3 -m app`

Then, send requests to `http://127.0.0.1:5000`.

### Frontend

In the frontend directory

1. Launch `Xcode`
2. Select `Open Existing Project...`
3. From the root directory of the repository, open `/frontend/JourneyGenie`
4. Run the project by pressing `Cmd+R` or from the play button in the top left corner, above the project navigator.
5. Use the app via the simulator - the pinch to zoom gesture on the map can be replicated by holding option then dragging the mouse

## API Usage

- [OpenAI](https://platform.openai.com/) model `GPT-3.5-turbo`
- [Visual Crossing](https://www.visualcrossing.com/weather-api)