from fastapi import FastAPI # type: ignore

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/location")
async def location():
    return {"city": "Lahore"}