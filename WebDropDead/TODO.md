1. run the server to see if it works now

rails server -d -p PORT -b 0.0.0.0
http://server.com:PORT

config.hosts << "server.com"

yarn upgrade

rails webpacker:install

update gitignore with /vendor/

2. check if it works
3. add to git repo

DONE

4. create scaffolds and add previous files

rails generate scaffold GameHistory game:references date_played:datetime
rails generate scaffold Game num_players:integer num_sides:integer num_dice:integer result:string user:references
rails generate scaffold User username:string email:string password:string user_page:boolean
rails db:migrate

5. delete old directory
6. delete old repo from gitlab