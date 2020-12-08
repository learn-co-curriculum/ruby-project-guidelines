# Venue and Date Tracker for Artists

# Goal: 
    The goal of our CLI application is to be a simple tool for Artists and allows venue and concert date tracking. This is implementing a user built database with venue locations already pre-seeded.

# Symbols throughout the README:
    1. "" ==> What is displayed in the application terminal
    2. '' ==> What to type into the terminal (excluding the '')

# Prerequisites and installation to get started:
    1. Please have the latest version of Ruby and an environment such Visual Studio.
    2. Fork and clone a copy of this repository into your local machine.
    3. Ensure that all gems have been installed and updated correctly. This will be done for you by running 'bundle install' and 'bundle update' in the terminal.
    4. Run 'rake db:migrate' once to create a database for storage.
    5. Run 'rake:db seed' once to have Venues and corresponding locations be pre-loaded into database.

# As a user of our application, an artist can do a few things:
    1. Create a profile/account if they do not have one.
    2. Create a date for a venue location to perform.
    3. View all of their current dates and matching venues.
    4. Update any existing venue dates. 
    5. Delete any existing concert or venue dates. 

# How to use our application:
    1. To start the application, type into the terminal 'ruby bin/run.rb' 

    2. Following the prompts, simply type in your artist name and the application will look for your profile in the database. If it exists, it will pull up your profile, otherwise, your profile will be created. 

    3. To access the menu, type in '0'

    4. Our program is based on number and key character typing selection. To access any of the listed options in the main menu, please type in your desired number option. 

    5. For example, if you choose the option "Upcoming or Past Dates" within the menu, type in '3' and more prompts will follow. 

        NOTE: When Selecting inner options, inputs must match what is displayed. EX: Within "Create Show", selecting a city name is case sensistive and has to be a inputted as a match to the list. 

    6. Each time an option has been completed, you will have to type '0' to return to the main menu. This prompt will viewable as well.  

    7. A brief video demonstration will be linked here as well: