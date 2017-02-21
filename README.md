# Movie Theater Project

View the app [here](https://theater-manage.herokuapp.com/)

## What it Does

This project enables users to manage a movie-theater, from the selling of tickets to the updating of showtimes. I have support for adding/removing screens, movies, showtimes, and viewing all orders, also enabling filtering by movie title.

## How, Why, and What I did

This project had a lot of design choices that I had to make and a few of them will be detailed here, with further info available upon request. Firstly:

### Testing

All software needs to be tested, and I wrote a small test-suite for model coverage, but I opted out of controller and feature tests. Reasoning is below.

#### Models

I opted for model test coverage here both for documenting at a glance what my models do and what's required (for my sanity and others) and for ensuring my associations were properly setup and ready to go. 

I feel I had decent test coverage on the models, but I didn't go for 100% coverage due to the scope of the challenge. Production code would be tested more thoroughly, but I opted for lighter coverage in favor of speed of method writing. I manually tested each method created, but I also understand that's often not enough.

#### Features

This, to me, was an optional achievement for the challenge, and one which I opted out of for time's sake. I learned a great deal in this challenge and pushed myself to explore new ways of writing a rails app and hitting the docs whenever I could, so integrating with CapyBara was on a back-burner and something I didn't want to stretch myself too thin on.

#### Controllers

On the advice of a QA I spoke with, controller tests seem to be getting phased out in favor of feature tests so again I opted to skip this step in the development process. With real client projects the necessity of testing is very apparent, but, again, given the scope of the challenge I opted for testing associations on my models and considered that adequate.

### User Login

Given the fact that the application didn't need user authentication for any admin-specific features, I chose to avoid the User model all together. If all features of this site can be accessed without authentication of admin or user, I found the need for logging in at all to be unnecessary.

### Styling

I chose to integrate my site with bootstrap-rails and bootstrap-form for styling. I chose not to implement a front-end framework on my own, deciding that Bootstrap can style and support my application better than I can individually. I chose very simple colors, opting to avoid worrying about overall color choices and focusing more on the features of the website.

### Legacy models/migrations

When my application was first created I drew up a schema that involved more models than I ended up needing (Theaters and Tickets). Instead of deleting these models/migrations and testing that each feature still worked (see reasoning for skipping feature tests above) I opted to leave in the models/migrations both for feature support of additional theaters and for multiple ticket purchases per show. In the end they seemed too time consuming to remove only for this code challenge and no functionality was broken with keeping the models around.

#### Ticket Model

This model would have served as an extension of the Order model, enabling one order to contain many tickets. Due to an order being described as "purchasing one ticket", however, I chose to avoid the added complexity of the one-to-many and opted for a much simpler system of an order functioning as its own ticket. This solves several issues that would have arrived and simplied the ordering process greatly.

#### Theater Model

Due to an initial miss-read of the feature list, a Theater was to serve as a holder for all the screens and ultimately the highest model on the heirarchy of belonging to. This model would have added support for multiple theaters if the client's needs ever expanded to several locations, but ended up being too ambitious for the client's needs. I opted out of many theaters and instead removed the validation on a screen requiring its association with a theater. This simplified the process of adding a screen and after removing the validation I saw no need to refactor the other class structure to be able to remove the Theater model entirely. 

If I began this project from scratch, I would avoid such thoughts from the start, clearly define an MVP and begin to design from a bottom-up approach, only adding models when my needs required it, as opposed to my niave approach of designing the models before the need arose.

### Error Handling

#### Using `find_by`

I didn't get that complex with error handling, but I did use `find_by` on every route that needed it as opposed to `find` to support the ability to handle errors more gracefully than just throwing exceptions each time something isn't found. Using `find_by` would enable the later use of an if-gate or logical check in the controller or in the view to display different templates/data if the item isn't found. 

#### Custom Error Pages

Customzed error pages (404, 422, 500, etc.) were not a main focus of mine. The rails error pages seemed to do a decent enough job for the task at hand, and the fact that not everything failed gracefully didn't concern me so much given it's "not a real-world problem". This was one of several features that I didn't feel would add enough overall to the app to justify the effort for the problem, so I ultimately opted to leave it out.

### End-User Feature Set

The following features are tested and functional:

* Add/Edit/Remove a screen, showtime, movie
* Place an order and receive an email with confirmation
* View All orders and filter by movie title (with pagination)
* View the accumulated price of all orders
* See a list of all movies
* See a list of all showtimes for a particular movie
* Read about one particular movie
* View all screens, set description, set playing movies
* Disabling sales when tickets are sold out

### Final Notes

Due to my models, my application has greater flexibility of number of showtimes the theater can offer at any given time. This flexibility comes with a known down-side of having to manually set the movie playing at a given screen and manually setting the showtime to display times that that movie is playing on that screen. This manual configuration certainly offers a trade-off of usability, but I think it lends more freedom to the end-user to have control of his/her theater at a per-showtime basis, and not limiting the user to any form of "only showtimes at X times/screens". 

If the need were to arise in a real-world client project, I would refactor my models to include more set-in-stone methods of showtimes and offer only one movie-per-screen slot across all showtimes enabling one-field changing of the movie playing at a particular screen. With the current implemented method, however, the owner can choose one movie for a 12:30 showing and another for the 3:00 matinee showing with one step of additional work.
