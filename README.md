# Module One Final Project Guidelines

Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

1. Provide a CLI
2. The CLI must provide access to data from a SQLITE3 database using ActiveRecord.
3. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database with data from an API that you hit using a separate adapter class.
4. The data provided must go at least one level deep, generally by showing the user a list of available data and then being able to drill down into a specific item. i.e If I'm building a library, I should have an option to view all of the books using `Book.all` and then an option to find a book by the id number.
5. The CLI application can not be a Music CLI application as that is too similar to the other OO Ruby final project. Also please refrain from using Kickstarter as that was used for the scraping 'code along'. Look at the example domains below for inspiration.
6. Use good OO design patterns. You should be creating and accessing objects - not hashes.

## Instructions

1. Create a new repository on GitHub for your application, ie: `name-cli-app`.
2. When you create the CLI app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
4. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
5. Make sure your project checks off each of the above requirements.
6. Prepare a video demo (narration helps!) describing how a user would interact with your working gem.
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.
