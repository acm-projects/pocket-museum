# Pocket Museum

## Objective
> Pocket Museum Is An Mobile App Designed To Be Your Personal Museum Guide That Allows You To Scan A Work Of Art And Learn More About Pieces Of Art, In An Easy Digestible Way

## Minimum Viable Product (MVP)
- Users Can Upload A Photo Of A Painting To The App
- App Searches Through Museum Database And Returns Title, Artist, Brief History/explanation Of Painting, And A Brief Overview Of The Artist
    - Use An Imaage Recognition API Or Train Model, To Identify The Image Of The Painting
- Alternatively, Paintings Can Be Searched By Title Or Artist
- Analyze Paintings From ONE Museum For The Time Being

## Stretch Goals
- *Easy*:
    - User Login And Authentication
    - Ability To Save The Photo Of The Painting And Related Information To It On The App And Be Able To Revisit It Later (Creating Your Own "Pocket Museum"!!!)
        - Sort By Artist/Medium/Style/Time Period
- **Medium**:
    - Give Recommendations Of Artworks Based On The Pieces You've Scanned Before
    - Add More Museum Databases To The Project
- ***Hard***:
    - Ability To Scan Artwork's Placard, Instead Of Manually Typing Artwork’s Title
    - Create A Map With Pinpoints, Denoting What Pieces Are Where And Color Code By Artist
    - *Game Feature*: If You Are Dealing With One Museum's Database For The Time Being, Have All Of The Art Pieces Loaded In, But Make Them "Locked", And Then The User Would Have To Scan A Piece To Unlock Those Pieces (Can Be Awarded With Different Levels Or Medals)
- ****EXTREME****:
    - *AR Feature*: Scan The Painting In The Museum And In Real Time, Display Information Related To That Painting On Your Phone

## Resources
- *API's*:
    - [Google Cloud Vision API](https://cloud.google.com/vision)
        - Uses Very Powerful Image Recognition For A Lot Of Categories; Use This For *MVP* Image Recognition, Since It Has A Good Accuracy For Identifying Most Common Paintings
    - [Watson Visual Recognition API](https://www.ibm.com/cloud/watson-visual-recognition) or [Clarifai API](https://www.clarifai.com/)
        - Really Good Image Recognition Features Of An Image
        - Doesn't Give Names Of Paintings
        - Both Allow You To Build Your Own Custom Model, Tailored To Your Own Images
        - Watson Offers 1000 API Calls/Per Month; Clarfai Offers 5000 API Calls/Per Month
        - NOTE: Attempt Implementation Of These Custom Models, Once MVP Is Built
    - [Metropolitan Museum API](https://metmuseum.github.io/)
        - Database That Stores Information Related To The Majority Of Paintings At The Metropolitan Museum
- *Editors*
    - [Visual Studio Code](https://code.visualstudio.com/)
        - [What is Visual Studio Code?](https://code.visualstudio.com/docs/editor/whyvscode)
        - [Why Use Visual Studio Code?](https://blog.eduonix.com/software-development/visual-studio-code-popular/)
- Front-End Technologies
- Back-End Technologies
