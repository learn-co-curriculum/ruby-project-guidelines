require_relative '../config/environment'
require 'pry'

happy_mood_array =
[Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 02", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 03", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 04", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 05", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 06", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
]

chill_mood_array =
[Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")]

sad_mood_array =
[Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")
Song.create(song_name: "Happy song 01", url: "https://open.spotify.com/track/6ugrRFZUNIpLiqhLUgC7ix?si=WZxbe3wnQ2mr_02dMl9-sA", mood: "Happy")


