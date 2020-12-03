require_relative '../config/environment'
require 'tty-prompt'

class AppCLI

    def run
        welcome
        # main_page
    end

    def welcome
        puts "Welcome to GameCore"
        puts "One and only reliable source for gamers."
        # puts "Sign In"
        # puts "Create Account"
        prompt = TTY::Prompt.new
        choices = {Sign_In: 1, Create_account: 2, Find_genres: 3, About: 4, exit: 5}
        variable = prompt.select("What would you like to do?", choices)
        if variable == 1
            self.sign_in
        elsif variable == 2
            self.create_new_user_page
        elsif variable == 3
            self.find_by_genres_page
        elsif variable == 4
            self.about_page
        elsif variable == 5
            self.exit_page
        end
           
    end

    def sign_in
        puts "Enter your Username:"
        prompt = TTY::Prompt.new
        name_input = gets.chomp
        puts "Enter your Password:"
        password = prompt.mask(password)
        @current_user = User.find_by_name(name_input)
        if ((name_input == @current_user.username) && (password == @current_user.password)) == true
            system('clear')
            main_page
        elsif
            system('clear')
            sign_in_page
        end
    end

    def create_new_user_page
        # t.string "name"
        # t.string "username"
        # t.string "password"
        # t.float "age"
        puts "Please fill the following:"
        puts "Enter name:"
            name = gets.chomp
        puts "Enter age:"
            age = gets.chomp
        puts "Create username:"
            username = gets.chomp
        puts "Create password:"
            password = gets.chomp
        
        @current_user = User.create(name: name, age: age, username: username, password: password)
        system('clear')
        puts"Account Created..... Directing you back to main page....."
        sleep 3
        system('clear')
        welcome

    end

    def about_page
        puts "WELCOME TO GAMECORE!!!!"
        puts "Here we have the most honest and accurate reviews for video games."
        puts "We literally have every single title ever created in the world!"
        puts "Gamecore started in 2012 as a simple email news letter that provided updates for new game releases."
        puts "Since then it has evolved into the most popular website and application for all game related news, primarily reviews"
        sleep 10
        main_page
    end

    def main_page
        puts "Games, Reviews, Ratings, Comments"
        puts "Welcome to GameLair"
    puts "Games!                      .:'                                  `:.        "                            
    puts "Best Reviews!              ::'                                    `::     "                              
    puts "Use our app               :: :.                                  .: ::   "                               
    puts "to find the               :   `.                                .'   :          "
    puts "best games!!!             `:.  `:.             .              .:'  .:'      "                                   
    puts "                            `::. `::           !           ::' .::'        "                                     
    puts "                                `::.`::.    .' ! `.    .::'.::'         "                                         
    puts "                                  `:.  `::::'':!:``::::'   ::'        "                                          
    puts "Since 2020!                       :'*:::.  .:' ! `:.  .:::*`:      "                                     
    puts "FlatIron Proud!                  :: HHH::.   ` ! '   .::HHH ::    "                                      
    puts "                                ::: `H TH::.  `!'  .::HT H' :::  "                                       
    puts "                                ::..  `THHH:`:   :':HHHT'  ..::     "                                        
    puts "                                `::      `T: `. .' :T'      ::'      "                                         
    puts "                                  `:. .   :         :   . .:' "                                          
    puts "                                    `::'               `::'  "                                           
    puts "                                      :'  .`.  .  .'.  `:   "                                           
    puts "                                      :' ::.       .:: `:  "                                             
    puts "                                      :' `:::     :::' `: "                                              
    puts "                                       `.  ``     ''  .'    "                                               
    puts "                                        :`...........':    "                                                
    puts "                                        ` :`.V   V.': '   "                                                 
    puts "                                         `:  `---'  :'     "
    puts "Welcome to GameCore"
    puts "One and only reliable source for gamers."
        # puts "Sign In"
        # puts "Create Account"
        prompt = TTY::Prompt.new
        choices = {About: 1, Find_Genres: 2, exit: 3}
        variable = prompt.select("What would you like to do?", choices)
        if variable == 1
            self.about_page
        elsif variable == 2
            self.find_by_genres_page
        else variable == 3
            system('Exit')
        end
    end

    def find_by_genres_page
        @current_genre = nil
        prompt = TTY::Prompt.new
        count = 0
        choices = []
        Game.game_genres.each do |game|
            choices << {name: game, value: count}
            count += 1
        end
        choices << {name: "Back To Main Page", value: count+1}
        var1 = prompt.select("What Genre?", choices)  
        if var1 == 0
                    @current_genre = "Action"
        elsif var1 == 1
                    @current_genre = "Adventure"
        elsif var1 ==2
                    @current_genre = "Fantasy"
        elsif var1 == 3
                    @current_genre = "Horror"
        elsif var1 ==4
                    @current_genre = "Platform"
        elsif var1 ==5
                    @current_genre = "Racing"
        else
            system('clear')
            main_page
        end
        system('clear')
            games_under_genre_page
    end

    def exit_page
        system('Exit')
    end

    
##### GENRES -> GAME ###################################################
#########################################################################
    # def adventure
    #     prompt = TTY::Prompt.new
    #     choices = []
    #     choices << {name: "god_of_war", value: 1}
    #     var = prompt.select("What Game?", choices)
    #     if var == 1
    #         self.god_of_war
    #     end  
    # end
    


    def games_under_genre_page
        Game.games_in_genre(@current_genre).each do |game|
            p game.name
        end
        choices = {Find_By_Genre: 1, Main_Page: 2}
        prompt = TTY::Prompt.new
        val = prompt.select("What would you like to do right now?", choices)
        if val == 1
            system('clear')
            find_by_genres_page
        else
            system('clear')
            main_page
        end
    end

#### GAMES -> to reviews #### 
    ######################################################################################
    def god_of_war
        prompt = TTY::Prompt.new
        choices = []
        choices << {see_reviews: "see_review", value: 1}
        choices << {create_reviews: "create_review", value: 2}
        var = prompt.select("what would you like to do?", choices)
            if var ==  1
                Review.all_reviews.each do |review|
                    if review.game_id == game1.game_id
                        puts " god of war has rating of #{review.rating}. here are some of the comments"
                    end
                end
            elsif var == 2
                User.new_review
            end
    end
    


end

# binding.pry
puts "HELLO WORLD"

AppCLI.new.run