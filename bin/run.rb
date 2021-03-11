require_relative '../config/environment'

# Favorite.user_favorites
# binding.pry

def welcome
    title = Artii::Base.new(:font => "slant")
    puts title.asciify("Crypto Tracker")
    puts "\n" * 1
    puts "has been initialized!!!"
    puts "\n" * 5

    #put Top 5 cryptos
end

def intro
    new_user_answer = PROMPT.yes?("Is this your first time loggin in?") do |q|
        q.suffix "Yes/No"
    end
    if new_user_answer
        new_user_sign_up
    else
        puts "\n" * 10
        existing_user_login
    end
end

def new_user_sign_up
    new_account = PROMPT.select("Create New Account or Login?", %w(Create Login))
    case new_account
    when "Create"
        @@current_user = User.create_new_user
        main_menu
    else "Login"
        existing_user_login
    end
end

def existing_user_login
    login_prompt = PROMPT.select("", %w(Login Exit))
    case login_prompt
    when "Login"
        find_username = PROMPT.ask("Enter your username:".light_blue, required: true)
        @@current_user = User.find_by(user_name: find_username)
        if @@current_user == nil
            puts "Incorrect username".light_red
            puts "Try Again!".light_green
            existing_user_login
        end
        valididate_password = PROMPT.mask("Enter your password:".light_blue, required: true)
        if valididate_password == @@current_user.password
            @@current_user
            main_menu
        else
            puts "Hacker detected!!!...".light_red
            puts "Well, maybe we will let you try again....ok, go for it!".light_green
            existing_user_login
        end
    else "Exit"
        exit
    end
end

def main_menu
    title = Artii::Base.new(:font => "slant")
    puts title.asciify("Welcome #{@@current_user.user_name}")
    puts "\n" * 1
    menu_selection = PROMPT.select("Select a menu option") do |main_menu|
        main_menu.enum "."
        main_menu.choice "My Portfolio"
        main_menu.choice "My Favorites"
        main_menu.choice "Top 20 Cryptos"
        main_menu.choice "Exit"
    end 

    case menu_selection
    when "My Portfolio"
        Portfolio.find_portfolios #<<<< Method NOT Done >>>>>#
    when "My Favorites"
        Favorite.user_favorites #<<<< Method NOT Done >>>>>#
    when "Top 20 Cryptos"
        Crypto.top_20 #<<<< Method NOT Done >>>>>#
    else "Exit"
        exit
    end

end

def exit 
    title = Artii::Base.new(:font => "slant")
    puts title.asciify("Adios!!!")
end

welcome
intro
