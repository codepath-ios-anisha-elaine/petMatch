# petMatch

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our app is a way for people to discover adoptable pets through Tinder-style swiping.

### App Evaluation
- **Category:** Lifestyle
- **Mobile:** 
  - **Location**: Users can select pets in a specified location range based on their current location.
  - **Swiping**: Users can swipe right on pets they want to adopt and have their favorites stored.
  - **Notifications**: Users notified when there are updates with a pet they like.
- **Story:** People who are interested in adopting pets have a fun way of dicovering new pets in their area. Our friends would find this an enjoyable way to find pets.
- **Market:** Our market is large because a lot of people want to adopt pets. Our app makes this easier and more accessible. Though there are other websites and apps that exist for discovering pets, our swiping feature makes it more engaging and easy to keep track of potential pets.
- **Habit:** The ability to swipe on new pets each day makes this app addictive. Users can log in each day and get updates on potential pets. Also the liking feauture is habit-forming.
- **Scope:** We think a basic version of the app would be doable in the timeframe of 6 weeks. We mainly need to figure out how to use the PetFinder API to display information about pets, store liked pets, and implement the swiping feature. We believe we have defined our app well and have a good idea of the main features we want to implement. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can input pet preferences (type, location, breed, age, etc.) and view a unique set of adoptable pets (up to ~100 unique pets) based on that.
* Users can swipe trough their matched pets. Pets are displayed with their images, adoption bio, and adoption center information. A right swipe saves the pet into their favorites.
* Users can access their favorited pets in a separate tab. When clicking on pet in this list, more detailed information is shown about the pet.

**Optional Nice-to-have Stories**

* Sign up and login 
* Notification updates on adopted pets (for instance, if they were adopted already) 
* "Super like" feature to save pets they are extremely interested in and prioiritize in their favorites list

### 2. Screen Archetypes

* Preferences screen
   * User can input preferences for pets (type, location, breed, age, etc.)
   * User can save preferences so that their search results are updated
* Swiping screen/results screen
   * Users can swipe through general information about individual pets
   * Users can swipe right on pets they want to add to their favorites
   * Users can swipe left on pets they do not want to add to their favorites
   * User sees error page if pets cannot be found for given criteria
* Favorites/Likes screen
    * User can see all the pets they've favorited
    * User can remove favorites
    * User can be redirected to 
    * User can click on a pet they've favorited to see more pet details
* Pet details page
    * User can see all the details about a pet, including adoption information
    * User can call or email the pet adoption center for specified pet

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Preferences Tab
* Favorites Tab
* Swiping Tab

**Flow Navigation** (Screen to Screen)

* Preferences -> Swiping
* Favorites -> pet selected -> pet information screen

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
