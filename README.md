# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate classes for your models and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. For example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributor's guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project. (2 minutes max)
6. Prepare a presentation to follow your video. (3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address what, if anything, you would change or add to what you have today.
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.






### Option One - Data Analytics Project
1. Access a Sqlite3 Database using ActiveRecord.

2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
User >--- Ticket ---< Event ---< Venue ---< City

User has_many Tickets
User has_many Events through Tickets
Ticket belongs to one user
Ticket belongs to one event
Event has_one venue
Event has_one City through Venue
Event has many tickets
Event has many users through tickets
Venue has many events
Venue belongs to one city

3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
Ticket master API
API Key: QATrioQ3vEzlLyBebumHRHuNBfT39vrZ
API call format: https://app.ticketmaster.com/{package}/{version}/{resource}.json?apikey=**{API key}
  -package: discovery?
  -version: v2? 
  -resources: event, attraction, classification, venue...

4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
I want to see all events in time frame in certain city
I want to see what types of events are happening within a time frame 
I want to see whats happening within a price range
I want to see a record of the events I've been too
I want to see upcoming events in a similar genres to ones I've attended be
I want to see if the event I had a ticket for has been cancelled
I want to see when my favorite band is coming to my city

5. You should provide a CLI to display the return values of your interesting methods.  
?

6. Use good OO design patterns. You should have separate classes for your models and CLI interface.


User CLI options
  -User starts by entering location
    -takes a string of city and checks if valid in database
      -if no, puts out "City not found"
      -if yes, store city in args hash, start next method for date

      0. search by attraction name.
      1. search by date MM/DD/YYYY
            0-9 reserved for results
            -if 0-9 puts event details with y to buy and n to go back 
            F. filter option menu which puts out which keys to input for another filter
                  D. to enter a date into the search and filter results by it
                  P. to enter a price into the search and filter results by it
                  G. to enter and filter by genre
      2.search by price
            0-9 reserved for results
            F. filter option menu which puts out which keys to input for another filter
                  D. to enter a date into the search and filter results by it
                  P. to enter a price into the search and filter results by it
                  G. to enter and filter by genre
      3. search by genre
            0-9 reserved for results
            F. filter option menu which puts out which keys to input for another filter
                  D. to enter a date into the search and filter results by it
                  P. to enter a price into the search and filter results by it
                  G. to enter and filter by genre

      -date input is string
        -check if valid, if not return to last page with puts error message
        -if valid, 


    -Entering B goes back to previous page
    -See all Events available by date 
    -see all Events available by price range
    -user sees list of events, can select one with 0-9 input
      -sees event, venue, price, then Y/N to purchase ticket
        -Y takes them back to main page
        -N goes back one level
    -purchase ticket for event
  -See events they have tickets for
    -see events they have tickets for by date
    -See events they have that are not cancelled



User class
  -instance variables: name

Ticket class
  -instance variables: user_id, event_id

Event
  -Location
  -price range
  -attraction name
  -genre




---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil



```
