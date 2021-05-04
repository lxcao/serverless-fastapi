'''
Author: clingxin
Date: 2021-05-04 18:24:54
LastEditors: clingxin
LastEditTime: 2021-05-04 18:31:16
FilePath: /serverless-fastapi/app/api/api_v1/api.py
'''
from fastapi import APIRouter

from .endpoints import users

router = APIRouter()
router.include_router(users.router, prefix="/users", tags=["Users"])