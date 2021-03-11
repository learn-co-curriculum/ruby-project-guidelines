User.destroy_all
Crypto.destroy_all
Favorite.destroy_all
Portfolio.destroy_all
Trade.destroy_all

#Users
u1 = User.create(user_name: "clu", password: "encom786")
u2 = User.create(user_name: "Celeste", password: "celeste12345")

#Cryptos
c1 = Crypto.create(name: "Bitcoin", symbol: "BTC", rank: 1, price: 49192.63, percent_change_1hr: 3.57, percent_change_24hr: 0.24, percent_change_7d: 0.44)
c2 = Crypto.create(name: "Ethereum", symbol: "ETH", rank: 2, price: 1665.12, percent_change_1hr: 4.17, percent_change_24hr: 0.72, percent_change_7d: 0.04)
c3 = Crypto.create(name: "Tether", symbol: "USDT", rank: 3, price: 1.00, percent_change_1hr: 0.09, percent_change_24hr: 0.19, percent_change_7d: 0.29)
c4 = Crypto.create(name: "Cardano", symbol: "ADA", rank: 4, price: 1.13, percent_change_1hr: 0.10, percent_change_24hr: 0.12, percent_change_7d: 0.13)
c5 = Crypto.create(name: "Binance Coin", symbol: "BNB", rank: 5, price: 227.68, percent_change_1hr: 0.14, percent_change_24hr: 0.15, percent_change_7d: 0.16)
c6 = Crypto.create(name: "Polkadot", symbol: "DOT", rank: 6, price: 33.81, percent_change_1hr: 0.17, percent_change_24hr: 0.18, percent_change_7d: 0.19)
c7 = Crypto.create(name: "XRP", symbol: "XRP", rank: 7, price: 0.4645, percent_change_1hr: 0.20, percent_change_24hr: 0.21, percent_change_7d: 0.22)
c8 = Crypto.create(name: "Uniswap", symbol: "UNI", rank: 8, price: 28.82, percent_change_1hr: 0.23, percent_change_24hr: 0.24, percent_change_7d: 0.25)
c9 = Crypto.create(name: "Litecoin", symbol: "LTC", rank: 9, price: 184.24, percent_change_1hr: 5.26, percent_change_24hr: 0.27, percent_change_7d: 0.28)
c10 = Crypto.create(name: "Chainlink", symbol: "LINK", rank: 10, price: 27.79, percent_change_1hr: 0.29, percent_change_24hr: 0.30, percent_change_7d: 0.31

#Portfolios 
p1 = Portfolio.create(user_id: u1.id)
p2 = Portfolio.create(user_id: u2.id)
p3 = Portfolio.create(user_id: u1.id)

#Favorites ===== > JOINER < =====
f1 = Favorite.create(name: "Bitcoin", price: 49192.63, symbol: "BTC", crypto_id: c1.id, user_id: u1.id)
f2 = Favorite.create(name: "Ethereum", price: 1665.12, symbol: "ETH", crypto_id: c2.id, user_id: u2.id)
f3 = Favorite.create(name: "Tether", price: 1.00, symbol: "USDT", crypto_id: c3.id, user_id: u1.id)

#Trades ===== > JOINER < =====
t1 = Trade.create(portfolio_id: p1.id, crypto_id: c1.id)
t2 = Trade.create(portfolio_id: p1.id, crypto_id: c2.id)
t3 = Trade.create(portfolio_id: p2.id, crypto_id: c1.id)
t4 = Trade.create(portfolio_id: p3.id, crypto_id: c1.id)