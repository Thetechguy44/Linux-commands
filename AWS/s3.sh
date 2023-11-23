#zip -r folder.zip folder
#install aws cli
apt install awscli -y

#Configure AWS CLI with Access & Secret Keys
#create IAM user and create Access key & Secret access key
# REGION : af-south-1
# OUTPUT FORMAT : json
aws configure 

# push to a bucket 
aws s3 sync . s3://easelowfiles/uploads

# pull from a bucket
aws s3 sync s3://easelowstorage .

#to change values like access key & secret key
cd ~/.aws






{
	"Version": "2012-10-17",
	"Id": "Policy1681201333331",
	"Statement": [
		{
			"Sid": "Stmt1681201331314",
			"Effect": "Allow",
			"Principal": "*",
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::easelowstorage/*"
		},
		{
			"Sid": "2",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E5LFMP2GN5Q3X"
			},
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::easelowstorage/*"
		},
		{
			"Sid": "3",
			"Effect": "Allow",
			"Principal": {
				"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E5LFMP2GN5Q3X"
			},
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::easelowstorage/*"
		}
	]
}