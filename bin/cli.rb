class CLI
  def initialize
    Bet.destroy_all
    Better.destroy_all
    Game.destroy_all
  end

  def main_menu
    puts "Welcome!"
    puts "*" * 30
    puts "What is your name?"
    puts "*" * 30
    name = get_user_response
    create_better(name)
    puts "Hi, #{name}!"
    puts "*" * 30
    #instructions for user
    puts "1. Change username"
    puts "2. Check point balance"
    puts "3. Play a game"
    option_picked = get_user_response
    if option_picked == "1"
      change_username
    end
  end

  def create_better(name)
    new_better = Better.new(username: name, points_balance: 10_000)
    new_better.save
  end

  def change_username
    puts "What would you like to change your name to?"
    get_user_response
  end

  def get_user_response
    gets.strip.downcase
  end
end
