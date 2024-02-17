# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  description :text
#  director    :string
#  name        :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  has_many :reviews
  has_many :movie_filming_locations
  has_many :filming_locations, through: :movie_filming_locations

  scope :with_avg_score, -> do
    joins(:reviews)
      .group('movies.id')
      .select('movies.*', 'AVG(reviews.stars) AS average_score')
  end

  scope :order_by_avg_score, ->(direction) do
    return unless direction.present?

    order("average_score #{direction}")
  end
end
