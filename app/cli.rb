class CLI
  def initialize
    @better = nil
    @bet_amount = nil
  end

  def main_menu
    if @better == nil
      puts ""
      puts "Welcome to Coin Collector!"
      puts ""
      puts "What is your name?"
      2.times { divider }
      name = get_user_response
      @better = create_better(name)
    end
    divider
    puts "Hi, #{@better.username}!"
    divider
    puts "You pick what to do next:"
    divider
    puts "1. Change username"
    puts "2. Check point balance"
    puts "3. Play a game"
    puts "4. Quit"
    divider
    option_picked = get_user_response
    if option_picked == "1"
      change_username
    elsif option_picked == "2"
      check_points_balance
    elsif option_picked == "3"
      play_game
    elsif option_picked == "4"
      divider
      puts "I hope you had fun! We'll miss you"
      divider
      exit
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
    puts "<>" * 15
    puts ""
  end

  def check_points_balance
    puts "Your current coin-count is #{@better.points_balance} coins."
    sleep(1.5)
    puts "Enter anything to return to the main menu"
    if get_user_response
      return self.main_menu
    end
  end

  def play_game(bet_amount = nil)
    new_game = Game.create
    game_result = new_game.result
    new_game.outcome = game_result
    new_game.save
    divider
    puts "How much would you like to bet?"
    bet_amount = get_user_response.to_i
    if bet_amount > @better.points_balance
      puts ""
      puts "Exceeded limit on bet amount. Please bet within your limit."
      play_game
      divider
    end
    new_bet = Bet.create(points_amount: bet_amount, better_id: @better.id, game_id: new_game.id)
    new_bet.points_amount = bet_amount
    divider
    puts "Heads or Tails?"
    user_guess = get_user_response
    divider
    puts "Flipping the coin!"
    divider
    sleep(2)
    if user_guess == game_result
      @better.points_balance += bet_amount
      @better.save
      sleep(2)
      divider
      puts "CONGRATULATIONS YOU WIN!!"
    else
      @better.points_balance -= bet_amount
      @better.save
      sleep(2)
      puts "try again, nerd"
    end
    divider
    bet_again
  end

  def bet_again
    puts "Would you like to place another bet?"
    puts "Y/N"
    option_picked = get_user_response
    if option_picked == "y"
      play_game
    elsif option_picked == "n"
      return self.main_menu
    elsif option_picked == "exit"
      #quits the app
    else
      puts "Did not understand answer, please type Y or N"
      bet_again
    end
  end

  def get_user_response
    gets.strip.downcase
  end
end
