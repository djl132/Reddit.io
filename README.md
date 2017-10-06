# README

## Description
A reddit-like app that allows people to create posts based on certain topics. Posts are ranked based on its age and points, determined by number of upvotes and downvotes. Following a post notifies user of new activity of the post, such as a comment, via email.

## Demo:

https://www.useloom.com/share/d256be4a424f4af680ce143fb78b1c7c


## Features

#### Relevance Ranking
 
  Posts in a topic are ranked based on time it was posted and the total number of points it has, which is determined by the number of upvotes and downvotes it has.

#### Roles

There are roles on this website. People with different roles have different degrees of authorization and can do more or less than the average typical user, who all have by default the role of a member.

 Admin:
  ex: Admin User
  Can create public and private topics, delete topics, as well as update or delete any posts or comments. 
  
Member:
  ex: Member User 
  Can create, update, delete their own posts. 

#### Profile View

Can view profile of another user, which displays his or her posts and comments.


## Configuration

Note:
In testing, in order to send email to someone, you must authorize them to Mailgun's testing sandbox domain's authorized list of recipients.

Authorization for Mailgun:<br />
Use figaro install to generate a safe file to securely put Mailgun key authorization information (login, password). 
```figaro install```

Bundle Gemfile:<br />
```bundle install```

Create database and set admin(named Admin User) and dummy member(named Memeber User):<br />
```rake db:create```<br />
```rake db:migrate```<br />
```rake db:seed```<br />

Run server:<br />
```rails s```









