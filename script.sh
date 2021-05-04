###
 # @Author: clingxin
 # @Date: 2021-05-04 18:36:01
 # @LastEditors: clingxin
 # @LastEditTime: 2021-05-04 18:47:36
 # @FilePath: /serverless-fastapi/script.sh
###

uvicorn app.main:app --reload
cd env/lib/python3.9/site-packages
zip -r9 ../../../../function.zip .
cd ../../../..
zip -g ./function.zip -r app

load function.zip to s3 bucket
create a lambda from s3, update the handlers
create API gateway, proxy method, invoke lambda