class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :crypto

    def self.user_favorites
        title = Artii::Base.new(:font => "slant")
        puts title.asciify("#{@@current_user.user_name}'s Favorites")

        tp.set Crypto, :rank, :name, :symbol, :price, :percent_change_1hr
        top_cryptos = tp Crypto.all, :except => :id
        puts "\n" * 2
        menu_selection = PROMPT.select("Please select from the following options:") do |main_menu|
            main_menu.enum "."
            main_menu.choice "Add Favorite"
            main_menu.choice "Remove Favorite"
            main_menu.choice "Back"
        end
        case menu_selection
        when "Add Favorite"
            favorites_list = ["Bitcoin", "Ethereum","Tether", "Cardano", "Binance Coin", "Polkadot", "XRP", "Uniswap", "Litecoin", "Chainlink" ]
            new_favorites = PROMPT.multi_select("Select your favorite crypto's to start tracking!", favorites_list, filter: true)
            new_favorites
            binding.pry
        when "Remove Favorite"
            #prompt for which crypto you would like to delete
        else "Back"
            main_menu
        end
    end

    def self.save
        #save new favorite
    end

end