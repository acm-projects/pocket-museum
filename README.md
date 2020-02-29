# Pocket Museum

## Objective
> Pocket Museum Is An Mobile App Designed To Be Your Personal Museum Guide That Allows You To Scan A Work Of Art And Learn More About Pieces Of Art, In An Easy Digestible Way

## Minimum Viable Product (MVP)
- Users Can Upload A Photo Of A Painting To The App
- App Searches Through Museum Database And Returns Title, Artist, Brief History/explanation Of Painting, And A Brief Overview Of The Artist
    - Use An Image Recognition API To Identify The Image Of The Painting
- Alternatively, Paintings Can Be Searched By Title Or Artist

## Stretch Goals
- *Easy*:
    - User Login And Authentication
    - Ability To Save The Photo Of The Painting And Related Information To It On The App And Be Able To Revisit It Later (Creating Your Own "Pocket Museum"!!!)
        - Sort By Artist/Medium/Style/Time Period
    - Voice Assistant
        - Plays an audio track based on the information related to the painting
- **Medium**:
    - Give Recommendations Of Artworks Based On The Pieces You've Scanned Before
- ***Hard***:
    - Ability To Scan Artwork's Placard, Instead Of Manually Typing Artwork’s Title
    - Create A Map With Pinpoints, Denoting What Pieces Are Where And Color Code By Artist
    - *Game Feature*: If You Are Dealing With One Museum's Database For The Time Being, Have All Of The Art Pieces Loaded In, But Make Them "Locked", And Then The User Would Have To Scan A Piece To Unlock Those Pieces (Can Be Awarded With Different Levels Or Medals)
    - Give recommendations to museums internationally, based on typed keywords
- ****EXTREME****:
    - *AR Feature*: Scan The Painting In The Museum And In Real Time, Display Information Related To That Painting On Your Phone
    - Display art events/exhibitions that are happening around you and see who else is planning to show up to those events

## Resources
- *Text Editor(s)*
    - [Visual Studio Code](https://code.visualstudio.com/)
        - [What is Visual Studio Code?](https://code.visualstudio.com/docs/editor/whyvscode)
        - [Why Use Visual Studio Code?](https://blog.eduonix.com/software-development/visual-studio-code-popular/)
        - Tutorials:
            - [Get Familiar With VS Code](https://www.youtube.com/playlist?list=PLC3y8-rFHvwhleivq1QohBZN4d8IdzG3c): No Need To Start Coding From This Video; Just Watch It To See What And How VS Code Works
            - [Full In-Depth Set Up](https://www.youtube.com/watch?v=fnPhJHN0jTE): I HIGHLY Suggest You Watch This Video When You Want To Properly Setup And Configure VS Code Optimally
- *Front-End Technologies*
    - Creates The App, Uses Onboard Camera, Handles Authentication, Displays Data Beautifully
    - [React Native](https://facebook.github.io/react-native/): Allows You To Build A Cross Platform App, While Accessing The Onboard Camera For The Phone
        - Uses [Javascript](https://www.javascript.com/)
        - [React Native Documentation](https://www.tutorialspoint.com/react_native/index.htm)
        - [Video Tutorial For React Native](https://www.youtube.com/watch?v=mkualZPRZCs)
    - [Flutter](https://flutter.dev/)
        - Builds Nice, Clean Cross-Platform Applications From A Single Codebase
        - Uses [Dart](https://dart.dev/)
            - [Dart Documentation](https://dart.dev/guides/language/language-tour)
            - [Video Tutorial For Dart](https://www.youtube.com/watch?v=OLjyCy-7U2U)
        - [Flutter Documentation](https://flutter.dev/docs/reference/tutorials)
        - [Video Tutorial For Flutter](https://www.youtube.com/watch?v=1gDhl4leEzA)
    - [Which To Use? React Native vs. Flutter](https://www.youtube.com/watch?v=tSyXb0sHBoE)
- *Back-End Technologies*
    - Handles Processing Of Data And Sends Desired Output Back To The Front-End
    - [Javascript](https://www.javascript.com/): Use Javascript, If Using React Native For Front-End
        - [JS Documentation](https://www.javascript.com/learn/strings)
        - [Video Tutorial for JS](https://www.youtube.com/watch?v=hdI2bqOjy3c)
    - [Python](https://www.python.org/): Powerful General Purpose Back-End Language
        - [Interactive Programming With Python](https://www.codecademy.com/learn/learn-python-3)
        - [Video Tutorial For Python](https://www.youtube.com/watch?v=YYXdXT2l-Gg&list=PL-osiE80TeTt2d9bfVyTiXJA-UTHn6WwU)
        
- *Database(s)*
    - [Firebase](https://firebase.google.com/)
        - Enables User Authentication And Stores User Info In Their DB (i.e Personal Gallery Of Paintings)
        - [Why Use Firebase?](https://www.tristatetechnology.com/blog/firebase-backend-mobile-app/)
        - Tutorials
            - [What Is Firebase?](https://www.youtube.com/watch?v=BXHQ5NxU2p8)
            - [Learn All Features About Firebase](https://www.youtube.com/playlist?list=PLl-K7zZEsYLm7CPS0xf-7E7EF3AFxWRCW)
            - [Using Flutter With Firebase](https://www.youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
            - Using React-Native With Firebase
                - [Detailed Tutorial #1](https://www.youtube.com/playlist?list=PLy9JCsy2u97m-xWAxGwHZ2vITtj4qBKDm): Goes Over Setup
                - [Detailed Tutorial #2](https://www.youtube.com/playlist?list=PLDr7Z-9oq655ltYjAj3dbEqEbdkALt0fJ): Does Not Go Over Setup
- *API's*:
    - [What is An API?](https://www.youtube.com/watch?v=s7wmiS2mSXY)
    - [Explanation Of REST API's](https://www.youtube.com/watch?v=7YcW25PHnAA)
    - [Google Cloud Vision API](https://cloud.google.com/vision)
        - Uses Very Powerful Image Recognition For A Lot Of Categories; Use This For *MVP* Image Recognition, Since It Has A Good Accuracy For Identifying Most Common Paintings
    - [Watson Visual Recognition API](https://www.ibm.com/cloud/watson-visual-recognition) or [Clarifai API](https://www.clarifai.com/)
        - Really Good Image Recognition Features Of An Image
        - Doesn't Give Names Of Paintings
        - Both Allow You To Build Your Own Custom Model, Tailored To Your Own Images
        - Watson Offers 1000 API Calls/Per Month; Clarfai Offers 5000 API Calls/Per Month
        - *NOTE*: Attempt Implementation Of These Custom Models, Once MVP Is Built
    - [Metropolitan Museum API](https://metmuseum.github.io/)
        - Database That Stores Information Related To The Majority Of Paintings At The Metropolitan Museum
