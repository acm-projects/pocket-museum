import io, os
from google.cloud import vision
from google.cloud.vision import ImageAnnotatorClient

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = r"C:\Users\viswa\Documents\Google Cloud\cloudkey.json"
client = vision.ImageAnnotatorClient()

file_name = os.path.abspath('Mona_Lisa.jpg')
image_path = os.path.join('.images', file_name)

with io.open(image_path, 'rb') as image_file:
    content = image_file.read()

# pylint: disable=no-member
image = vision.types.Image(content=content)
response = client.web_detection(image=image)
web_detection = response.web_detection

web_detection.best_guess_labels
web_detection.full_matching_images
web_detection.visually_similar_images
web_detection.pages_with_matching_images
web_detection.partial_matching_images

maximum = 0
# recommend tags for the image based on data collected from the web
for entity in web_detection.web_entities:
    print(entity.description)
    print(entity.score)
