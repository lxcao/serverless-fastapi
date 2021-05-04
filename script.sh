###
 # @Author: clingxin
 # @Date: 2021-05-04 18:36:01
 # @LastEditors: clingxin
 # @LastEditTime: 2021-05-04 18:56:03
 # @FilePath: /serverless-fastapi/script.sh
###

virtualenv -p python3.9 env

pipdeptree --exclude pipdeptree,pip,setuptools,wheel --warn silence | grep -E '^\w+' > requirements.txt

uvicorn app.main:app --reload
cd env/lib/python3.9/site-packages
zip -r9 ../../../../function.zip .
cd ../../../..
zip -g ./function.zip -r app

load function.zip to s3 bucket
create a lambda from s3, update the handlers
create API gateway, proxy method, invoke lambda