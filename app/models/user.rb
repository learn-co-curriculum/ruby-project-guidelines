class User < ActiveRecord::Base 
    #relationships need to be setup with the joiner class first
    has_many :portfolios
    has_many :trades, through: :portfolios

    has_many :favorites
    has_many :cryptos, through: :favorites

    # Create New User

    def self.create_new_user
        new_user = self.new_username # >>>> CREATE .new_username METHOD <<<<<< DONE****
        new_user.password = self.set_password # >>>> CREATE .set_password METHOD <<<<<< DONE ***
        new_user.save
        @current_user = new_user
    end

    def self.new_username
        set_username = PROMPT.ask("What would you like your username to be?", required: true)
        username_confirmation = PROMPT.yes?("You entered #{set_username .light_blue.bold}, is that correct?") do |q|
            q.suffix 'Yes/No'
        end
        
        if username_confirmation # If 'user_confirmation' is 'Yes'
            if User.find_by(user_name: set_username ) == nil # If 'user_name' does not exist
                User.create(user_name: set_username )
            else
                puts "#{set_usernameight_red.bold} is NOT available. Please try another username..."
                self.new_username
            end
        else
            self.new_username # If 'username_confirmation' is 'No' starts sequence over
        end
    end

    def self.set_password
        user_password = PROMPT.mask("What would you like your password to be?", required: true) do |q|
            q.validate(/^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/)
            q.messages[:valid?] = "Password needs at least 6 characters with a minimum of one letter and one number" 
            # Runs all the validations within the specified context. Returns true if no errors are found, false otherwise.
            # Aliased as #validate.
        end
        password_confirmation = PROMPT.mask("Confirm Password".light_blue, required: true)
        if user_password == password_confirmation
            user_password
        else
            self.set_password
        end
    end

    ### NEED TO MAKE A #my_favorites method
end