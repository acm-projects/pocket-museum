
###################################################################################################################################
# Install firebase admin

# install libraries needed

mycredentials = credentials.Certificate('service-account.json')

# initialize firebase app
firebase_admin.initialize_app(mycredentials, {
    # provide the url of the real time database
    'databaseURL': 'https://pmuploadtofirebase.firebaseio.com/'
})

# add the data to database

# get the database reference
ref = db.reference('/')

# set the reference to contain an array of paintings
ref.set({

    # The array of paintings will store information about
    # all the paintings, It is an array of paintings
    'Paintings':
    {
        # This is the first painting in the array
        # When connected to google-cloud vision API, we can create an array of paintings (or a class) and retrieve information about each painting
        # instead of just getting 1 painting like this here, we can access the painting with an array such as titles[0] if titles was the array we created
        title: {
            'artist': artist_name,
            'wikiImageUrl': image,
            'date': date,
            'medium': medium

        }

    }
})
