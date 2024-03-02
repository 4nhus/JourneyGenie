# JourneyGenie

## Backend
1. Install `venv` using `pip3 install virtualenv`
2. Run `cd backend && python3 -m venv venv`
3. Run `source venv/bin/activate`
4. Run `pip3 install -r requirements.txt`
5. Get the OPENAI_API_KEY and run `echo "OPENAI_API_KEY={key}" > .env`, replacing `{key}` with the key.
6. Run `python3 -m app`

Then, send requests to `http://127.0.0.1:5000`.

### Adding new libraries to `venv`
1. Run the virtual environment using steps 1-3 above.
2. Run `pip3 install {package_name}`
3. When done, run `pip3 freeze > requirements.txt` 