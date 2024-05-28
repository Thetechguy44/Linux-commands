#zip -r folder.zip folder
#install aws cli
apt install awscli -y

#Configure AWS CLI with Access & Secret Keys
#create IAM user and create Access key & Secret access key
# REGION : af-south-1
# OUTPUT FORMAT : json
aws configure 

# push to a bucket 
aws s3 sync . s3://examplefiles/uploads

# pull from a bucket
aws s3 sync s3://examplestorage .

#to change values like access key & secret key
cd ~/.aws

