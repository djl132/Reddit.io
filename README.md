# README

## Description
A reddit-like app that allows people to create posts based on certain topics. Posts are ranked based on its age and points, determined by number of upvotes and downvotes. Following a post notifies user of new activity of the post, such as a comment, via email.


## Features (pending)

extra feature: roles. 
There are roles on this website. People with different roles have different degrees of authorization. 

Admin: 
  Can create topics, delete topics, as well as update or delete any posts or comments.
  



## Configuration:

Note:
In testing, in order to send email to someone, you must authorize them to Mailgun's testing sandbox domain's authorized list of recipients.

Authorization for Mailgun:
Use figaro install to generate a safe file to securely put Mailgun key authorization information (login, password). 
```figaro install```

Bundle Gemfile:
```bundle install```

Run server:
```rails s```







