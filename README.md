# Cloud-Resume-AWS
 This is my resume hosted on a AWS


# Step 1: Create an AWS account and give the account permissions.

First off we want to set up MFA and setup a new user with which we can login to so that we are on the safe side.

![](Attachments/addingpermissions.png)

We can add permissions in here to allow our user to handle certain tasks.

![](Attachments/permissionadded.png)

We added our permission of "AmazonS3FullAccess" so that our user has full access to our S3 bucket that we will create later.

# Step 2: Create a S3 Bucket and upload our frontend to it.

![](Attachments/s3bucket.png)

Lets type into the search bar "S3" and create a S3 Bucket to which we can upload our frontend onto.

![](Attachments/createbucket.png)

We have no buckets at the moment in here so its all empty. Let us create a new bucket for this project!

![](Attachments/mybucket.png)

We can now upload files to our bucket so let us upload our frontend folder that we have created for this project onto our bucket.

![](Attachments/uploadhere.png)

![](Attachments/uploadsuccessful.png)

Let us also make sure that our "Default root object" is the "index.html" file of our frontend website. This specifies what the default root object should be, when we access the created CloudFront URL.

![](Attachments/defaultrootsettting.png)

![](Attachments/defaultrootobject.png)

We have made our bucket not public yet so we are not able to access the contents of the bucket yet. For that we will use CloudFront.

## CloudFront

Search up "CloudFront" in the search bar.
CloudFront is a AWS service to handle data with low latency and a high transfer speed.

![](Attachments/CloudFront.png)

Create a distribution. (Take the S3 Bucket that you have created in the previous step).

We select Origin access control settings for the "Origin access" and then we copy the policy. With this we can allow CloudFront to use these settings to allow us to see the insides of the specified bucket.

![](Attachments/distirbutioncloudfront.png)

We go back to the CloudFront settings and under "Viewer protocol policy" we select "HTTPS only" so that our connection is secured.

![](Attachments/httpssetting.png)

Now we can go back to the Distribution and copy the policy. go on our Bucket policy and edit it.

Paste the policy that we have gotten from the CloudFront to the policy editor.

![](Attachments/policyeditor.png)

## Adding DNS

With the help of Route53 we can add our own custom domain into this project.
I will skip this step since I am using AWS free tier and it only has limited resources.

# Step 3: API and DynamoDB

Lets search for "DynamoDB" in the search bar and create a table.

![](Attachments/dynamocreatetable.png)

Its important that we create a "Partition key" mine will be set to "id".

![](Attachments/partition%20key.png)

We now have created a DynamoDB table so let us create an item inside of the table.

![](Attachments/createitem.png)

Now we want to create an item that stores our "views".

![](Attachments/views%20attribute.png)

## API

Since we don't want to fetch directly from DynamoDB we will create a lambda function that does that for us.

So let us create a lambda function. We type in "lambda" into the search bar and create a new lambda function.

![](Attachments/createlambda.png)

This is pretty straight forward. We pick our programmming langauge that we are going to use to create the backend. I choose Python.

![](Attachments/pythonapi.png)

Inside of the advanced settings I also enable the function URL. So that we can assign HTTPS endpoints to our Lambda function. So we gain a public URL with which we can invoke our lambda function through.

![](Attachments/enablefunctionurl.png)

Settings I also enable are.

![](Attachments/nonesetting.png)

So that there is no authentication needed.

![](Attachments/CORSsetting.png)

with CORS we can whitelist our own domain to have access to our resume.

With these settings we can create our Lambda function now.

![](Attachments/codeeditor.png)

Now we can edit our lambda function. We want to create a function that fetches data from the DynamoDB database.




