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

We have made our bucket not public yet so we are not able to access the contents of the bucket yet. For that we will use CloudFront.

## CloudFront

Search up "CloudFront" in the search bar.
CloudFront is a AWS service to handle data with low latency and a high transfer speed.

![](Attachments/CloudFront.png)

Create a distribution. (Take the S3 Bucket that you have created in the previous step).

We select Origin access control settings for the "Origin access" and then we copy the policy. With this we can allow CloudFront to use these settings to allow us to see the insides of the specified bucket.

![](Attachments/distirbutioncloudfront.png)

Now we go on our Bucket policy and edit it.

Paste the policy that we have gotten from the CloudFront to the policy editor.

We go back to the CloudFront settings and under "Viewer protocol policy" we select "HTTPS only" so that our connection is secured.

![](Attachments/httpssetting.png)

## Adding DNS

With the help of Route53 we can add our own custom domain into this project.
I will skip this step since I am using AWS free tier and it only has limited resources.

