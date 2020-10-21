class CLI
  def initialize
    # Bet.destroy_all
    # Better.destroy_all
    # Game.destroy_all
    @better = nil
  end

  def main_menu
    if @better == nil
      puts ""
      puts "Welcome to Coinz!"
      puts ""
      puts "What is your name?"
      divider
      name = get_user_response
      @better = create_better(name)
    end
    divider
    puts "Hi, #{@better.username}!"
    divider
    puts "This game has 5/5 stars on the App Store!"
    puts "You pick what to do next:"
    divider
    puts "1. Change username"
    puts "2. Check point balance"
    puts "3. Play a game"
    option_picked = get_user_response
    if option_picked == "1"
      change_username
    elsif option_picked == "2"
      check_points_balance
    elsif option_picked == "3"
    end
  end

  def create_better(name)
    new_better = Better.new(username: name, points_balance: 10_000)
    new_better.save
    new_better
  end

  def change_username
    puts "What would you like to change your name to?"
    new_name = get_user_response
    @better.username = new_name
    divider
    @better.save
    puts "#{new_name}, what a kickass name!"
    divider
    sleep(2.5)
    return self.main_menu
  end

  def divider
    puts ""
    puts "*" * 30
    puts ""
  end

  #need to create the method that updates this once user places a bet ?
  def check_points_balance
    puts "Your current balance is #{@better.points_balance}."
    # The transition back to the main menu is too fast!
    # Wait for a sec...
    sleep(2.5)
    return self.main_menu
  end

  def get_user_response
    gets.strip.downcase
  end
end
