# README

A reddit-like app that allows people to create posts based on topic. The most upvoted posts will go to the top after accounting for time decay. You can also favorite posts to keep updated about the post, such as comments. You will be notified via email about any new activity of the post.


## Features (pending)

In order to run just pull the repository and run:

```bundle install```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

  * Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Configuration:

MailGun will only authorize app to send to authorized recipients of the testing sandbox domain. Therefore, you must add tested recipients to your list of authorized recipients for your own domain. 

Use figaro install to gneerate a safe file to securely put mail gun key information. 
```figaro install```

Bundle Gemfile:

```bundle install```

Run server;
```rails s```





