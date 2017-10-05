# README

## Description
A reddit-like app that allows people to create posts based on certain topics. Posts are ranked based on its age and points, determined by number of upvotes and downvotes. Following a post notifies user of new activity of the post, such as a comment, via email.

## Demo:

https://www.useloom.com/share/d256be4a424f4af680ce143fb78b1c7c


## Features

#### Roles

There are roles on this website. People with different roles have different degrees of authorization. 

Admin:
  ex: Admin User
  Can create public and private topics, delete topics, as well as update or delete any posts or comments. 
  
Member:
  ex: Member User 
  Can create, update, delete their own posts. 

#### Profile View

Can view profile of another user, which displays his or her posts and comments.



## Configuration:

Note:
In testing, in order to send email to someone, you must authorize them to Mailgun's testing sandbox domain's authorized list of recipients.

Authorization for Mailgun:
Use figaro install to generate a safe file to securely put Mailgun key authorization information (login, password). 
```figaro install```

Bundle Gemfile:
```bundle install```

Create database and set admin(named Admin User) and dummy member(named Memeber User):
```rake db:create```
```rake db:migrate```
```rake db:seed```

Run server:
```rails s```









