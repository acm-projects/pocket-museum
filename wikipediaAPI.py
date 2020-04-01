# import the libraries below
from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
import re
import wikipedia
import wikipediaapi
from urllib.request import urlopen


title = 'the last supper'


# DISCUSS VARIETY OF LANGUAGE SUPPORT FUNCTIONALITY WITH THE FRONTEND
wiki = wikipediaapi.Wikipedia('en')


wiki_page = wiki.page(title)

# if the page does not exist then print out a message saying that there is not a wikipedia page about the passed in title
if wiki_page.exists() == False:
  print("Not enough information can be presented")

# get the page's url
my_url = wiki_page.fullurl

# opening connection and getting the page
uClient = uReq(my_url)

# put the content in page_html variable
page_html= uClient.read()

#close the client
uClient.close()

# call the soup function to parse the HTML
page_soup = soup(page_html, "html.parser") 

# get the container that has the picture and other information including artist and the year
# the container is the manual of style of the page
container= page_soup.find("table", {"class":"infobox vevent"})

# set artist, year, and medium to empty string for now
artist = ''
year = ''
medium = ''


html = urlopen(my_url)
bs = soup(html, 'html.parser')
images = bs.find_all('img', {'src':re.compile('.jpg')})
for image in images: 
    image = image['src']+'\n'
    break
    


  # find all the th html tags in only the container specified above
ths = container.find_all('th')
#if ths is not None:    

  # loop through all the th tags
for th in ths:

  # if the text of th tag is 'Artist' then use the find_next_sibling function to get the td tag and assign its text to artist_name
  if th.text == 'Artist':
    artist_name = th.find_next_sibling("td").text

  # if the text of th tag is 'Year' then use the find_next_sibling function to get the td tag and assign its text to date
  elif th.text == 'Year':
    date = th.find_next_sibling("td").text
  # if the text of th tag is 'Medium' or type then use the find_next_sibling function to get the td tag and assign its text to medium
  elif th.text == 'Medium' or th.text == "Type":
    medium = th.find_next_sibling("td").text

# convert date to string and use the re.sub function to remove the strings and spaces(we only want numbers)


##################################################################################################################################################
# BUT MONA LISA DESCRIPTION SAYS "c. 1503–1506, perhaps continuing until c. 1517" AND PERHAPS CONTINUING UNIL PART WILL CUT OUT WHICH MIGHT BE BAD
##################################################################################################################################################



# By default, date will return 'c. 1650' for example in return and re.sub will strip out c. and return 1650 only
date = str(date)

# use the replace function instead of re.sub function to get rid of the characters "c." only and preserve the character "c"
date = date.replace("c. ", "")



# label and print the title,image, artist, time period, and medium in that order
artist = "Artist:" + " " + artist_name
time_period = "Time Period:" + " " + date
art_medium = "Medium:" + " " + medium

print(title)
print(image)
print(artist)
print(time_period)
print(art_medium)

# print the summary from wikipedia page and put a default sentence length of 3 
# 


# (ASK FRONT END)




#
#

summary = "Summary:" + str(wikipedia.summary(title, sentences = 3))
summary = summary.replace("()", "")
print(summary)

# Tested the code for the following paintings and correct output received
# Mona Lisa, Starry Night, The Scream, The Girl with pearl Earring, The Last Supper

#Note: getting this error while trying out different titles:    ths = container.find_all('th')
# AttributeError: 'NoneType' object has no attribute 'find_all'
#But works with Mona Lisa and The Scream
