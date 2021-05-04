'''
Author: clingxin
Date: 2021-05-04 18:23:26
LastEditors: clingxin
LastEditTime: 2021-05-04 18:31:05
FilePath: /serverless-fastapi/app/main.py
'''
from fastapi import FastAPI

from app.api.api_v1.api import router as api_router
from mangum import Mangum

app = FastAPI()


@app.get("/")
async def root():
    return {"message`": "Hello World!"}


app.include_router(api_router, prefix="/api/v1")
handler = Mangum(app)