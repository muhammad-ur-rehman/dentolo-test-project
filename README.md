
# dentolo Test Project

### Description
You are about to start a pet project that collects all the cultural activities in Berlin into one
site. There are many resources that can provide you with this information.

### Requirement 

- Implement the code needed to parse two of the "web sources" of your choice into the
standardized format.
- Implement the code required to collect this information and show it on a website.
Users should be able to see the events on the website.
- Implement a back-end filtering mechanism. Users should be able to filter the events based on different criteria:

    * Web Source
    * Dates
    * Simple partial text search on the title (no need to implement a complex search here, SQL "like" or similar is enough)

-  Make it possible to add new events to your website frequently. Users should be able
to access fresh events
- Please make it all as production-ready as possible.

### Provided Sites
- https://www.co-berlin.org/en/calender
- https://www.berghain.berlin/en/program/
- https://www.gorki.de/en/programme/2022/02/all
- https://www.visitberlin.de/en/event-calendar-berlin



## Project setup

To succesfuly run this project these are the requirements:
- `Ruby version = ruby-2.7.1`
- `Rails version = rails-6.1.6.1`

Once you have completed the requirements and Cloned the project. Navigate to project directory, in project directory
please follow these steps


Clone the project

```bash
  git clone git@github.com:muhammad-ur-rehman/dentolo-test-project.git
```

Go to the project directory

```bash
  cd dentolo-test-project
```

Install dependencies

```bash
  bundle Install
```
Install WebPacker

```bash
  yarn
```

Set up database credentials in database.yml and than setup database by

```bash
  rails db:setup
```

Run Server

```bash
  rails s
```
### Auther 
- [@muhammad-ur-rehman](https://www.github.com/muhammad-ur-rehman)
