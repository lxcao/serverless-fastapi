'''
Author: clingxin
Date: 2021-05-04 18:25:27
LastEditors: clingxin
LastEditTime: 2021-05-04 18:31:30
FilePath: /serverless-fastapi/app/api/api_v1/endpoints/users.py
'''
from fastapi import APIRouter

router = APIRouter()

@router.get("/")
async def root():
    return {"message": "Get Users!"}