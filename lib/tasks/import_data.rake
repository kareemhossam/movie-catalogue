# frozen_string_literal: true

# lib/tasks/import_data.rake

namespace :import do
  desc 'Import data from CSV file'
  task csv_data: :environment do
    require 'csv'

    movies_csv_file = "#{Rails.root}/public/movies.csv"
    reviews_csv_file = "#{Rails.root}/public/reviews.csv"

    CSV.foreach(movies_csv_file, headers: true) do |row|
      filming_location = FilmingLocation.find_or_create_by(country: row['Country'], city: row['Filming location'])
      actor = Actor.find_or_create_by(name: row['Actor'])

      movie = Movie.find_or_create_by(
        name: row['Movie'],
        description: row['Description'],
        year: row['Year'].to_i,
        director: row['Director']
      )
      MovieFilmingLocation.find_or_create_by(movie_id: movie.id, filming_location_id: filming_location.id)
      MovieActor.find_or_create_by(movie_id: movie.id, actor_id: actor.id)
    end
    puts "Data imported successfully from #{movies_csv_file}"

    CSV.foreach(reviews_csv_file, headers: true) do |row|
      Review.find_or_create_by(
        user_id: User.find_or_create_by(name: row['User']).id,
        movie_id: Movie.find_by(name: row['Movie']).id,
        body: row['Review'],
        stars: row['Stars']
      )
    end
    puts "Data imported successfully from #{reviews_csv_file}"
  end
end
