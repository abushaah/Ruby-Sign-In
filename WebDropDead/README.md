# README

### WebDropDead Rails Application

### View the site using the following url while connected to server:
- http://server.com:PORT

### Summary of what I learned:
- 1: project setup
    - mkdir A2
    - cd A2
    - rails new WebDropDead
    - bundle config --local disable_platform_warnings true
    - bundle install --path vendor/bundle
    - bundle update listen
    - yarn install
    - rails webpacker:install
    - rails server -d -p PORT -b 0.0.0.0
    - lsof -i tcp:PORT
    - kill -9 PID
    - git remote add origin https://git...
    - git add .
    - git commit -m "Initial commit, rails setup"
    - git push -u origin master

- 2: Scaffolds
    - rails generate scaffold User username:string email:string password:string
    - rails generate scaffold Game num_players:integer num_sides:integer num_dice:integer result:string user:references
    - rails generate scaffold GameHistory game:references user:references date_played:datetime
    - rails db:migrate

    - In case of undo:
        - rails db:rollback STEP=1 (most recent scaffold)
        - rails destroy scaffold <ScaffoldName>

- 3: Models
    - 1. add association relationship
        - user.rb: 1 to many game.rb and history.rb
        - game.rb: 1 game to 1 game history
        - game_history.rb:
        
    - 2. validation for parameters on input (ASSUMPTIONS)
        - user.rb: must include username, email, password on sign up
        - game.rb: must include num_players, num_sides, num_dice
        - game_history.rb:

    - 3. add drop_dead_dice game logic

- 4: Controllers
        - rails generate controller Sessions new create destroy
        - application_controller: before_action :set_cache_headers for sign in and sign out
        - sessions_controller.rb: add code for create, destroy, add user_params for sign in and sign out
        - users_controller.rb: add require_login for authentication
        - game_controller.rb: logic for running and repeating the auto drop dead game
        - game_histories_controller.rb: logic for getting game history

- 5: View
    - sessions#new: sign in and sign up form
    - users#show: user page
    - game#new: form to play new game
    - game#show: shows the result of the auto drop dead game
    - game_histories#index: display list of historical games and form for input
    - game_histories#show: display historical game selected by user

- 6: Routes
    - Session: default new session, create (login), destroy (logout)
    - Users: show, new, create defined methods
    - games: show, new, create defined methods, repeat game method, belongs to user (nested)
    - game_histories: index, show defined methods, select game method, belongs to user (nested)

- 7: Migrations
    - Game Histories: auto increment is not unique to each user-game pair
        - Adjustments:
            - rails generate migration AddUserGameHistoryIdToGameHistories user_game_history_id:integer
            - rails db:migrate
            - update across application

- 8: Rename Rails Project
    - Create a new project, there will be some dependency with the old name that will cause headaches :)

- 9: Misc
    - faster search with command line argument: git grep 'word to search'
    - Running the server:
        - rails server -d -p PORT -b 0.0.0.0
    - Stopping the server:
        - lsof -i tcp:PORT
        - kill -9 PID
    - delete records from tables:
        - rails console
        - Model.delete_all
            - note: does not cascade, must delete dependency first

----

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
