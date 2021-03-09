#Users
u1 = User.create(user_name: "clu", password: "encom786")
u2 = User.create(user_name: "Celeste", password: "celeste12345")

#Cryptos
c1 = Crypto.create(name: "Bitcoin", symbol: "BTC", rank: 1, price: 49192.63, percent_change_1hr: 3.57, percent_change_24hr: 0.24, percent_change_7d: 0.44)
c2 = Crypto.create(name: "Ethereum", symbol: "ETH", rank: 2, price: 1665.12, percent_change_1hr: 4.17, percent_change_24hr: 0.72, percent_change_7d: 0.04)
c3 = Crypto.create(name: "Tether", symbol: "USDT", rank: 3, price: 1.00, percent_change_1hr: 0.09, percent_change_24hr: 0.19, percent_change_7d: 0.29)
c4 = Crypto.create(name: "Cardano", symbol: "ADA", rank: 4, price: 1.13, percent_change_1hr: 0.10, percent_change_24hr: 0.12, percent_change_7d: 0.13)
c5 = Crypto.create(name: "Binance Coin", symbol: "BNB", rank: 5, price: 227.68, percent_change_1hr: 0.14, percent_change_24hr: 0.15, percent_change_7d: 0.16)
# c6 = Crypto.create("Polkadot", "DOT", 6, 33.81, 0.17, 0.18, 0.19)
# c7 = Crypto.create("XRP", "XRP", 7, 0.4645, 0.20, 0.21, 0.22)
# c8 = Crypto.create("Uniswap", "UNI", 8, 28.82, 0.23, 0.24, 0.25)
# c9 = Crypto.create("Litecoin", "LTC", 9, 184.24, 5.26, 0.27, 0.28)
# c10 = Crypto.create("Chainlink", "LINK", 10, 27.79, 0.29, 0.30, 0.31

#Favorites
f1 = Favorite.create(name: "Bitcoin", price: 49192.63, symbol: "BTC", crypto_id: 1, user_id: 1)
f2 = Favorite.create(name: "Ethereum", price: 1665.12, symbol: "ETH", crypto_id: 2, user_id: 2)
f3 = Favorite.create(name: "Tether", price: 1.00, symbol: "USDT", crypto_id: 3, user_id: 1)

#Portfolios
p1 = Portfolio.create(user_id: 1)
p2 = Portfolio.create(user_id: 2)!!!

#Trades
t1 = Trade.create(portfolio_id: 1, crypto_id: 1)
t2 = Trade.create(portfolio_id: 1, crypto_id: 2)
t3 = Trade.create(portfolio_id: 2, crypto_id: 1)
t4 = Trade.create(portfolio_id: 3, crypto_id: 1)