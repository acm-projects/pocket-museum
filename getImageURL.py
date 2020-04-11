
# define the image_url here so it can be accessed outside of the function
image_url = ''
# This function will print out the url of the latest image(which is the last object) stored in firebase cloud storage
def get_url():
    # import storage
    from google.cloud import storage

    # Explicitly use service account credentials by specifying the private key
    # file.
    storage_client = storage.Client.from_service_account_json(
        'service-account.json')

    # get all the buckets in the account
    buckets = list(storage_client.list_buckets())

    # get the first bucket, which is the first element of the list
    firstBucket = buckets[0]
     # https://console.cloud.google.com/storage/browser/[bucket-id]/
    bucket = storage_client.get_bucket(firstBucket)
    # Then do other things...
    #blob = bucket.get_blob('napolean.JPG')
    #print(blob.public_url)

# Set blobs to all the objects in the bucket and loop through all the objects in the bucket, and store the file name of the last object(most recent)
# to the lastFileName variable
    blobs = storage_client.list_blobs(bucket)

    for blob in blobs:
        # set the file name to the last file since it is the one that is the most recent
        lastFileName = blob.name

    # get that last file object and set image_url variable to the url of that object and print the url
    blob = bucket.get_blob(lastFileName)
    image_url = str(blob.public_url)
    print(image_url)


# call the function to execute the code and get the image url
get_url()
