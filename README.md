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



We can now upload files to our bucket so let us upload our frontend folder that we have created for this project onto our bucket.

Let us go to our bucket once more to setup a setting. Scroll to the bottom until you find the setting "Static website hosting" and redirect the traffic to the "index.html" file.

We have made our bucket not public yet so we are not able to access the contents of the bucket yet. For that we will use CloudFront.

## CloudFront

