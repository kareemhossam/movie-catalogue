# frozen_string_literal: true

# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  scope :search_by_name, ->(search) do
    return unless search.present?

    where('LOWER(name) LIKE ?', "%#{search.downcase}%")
  end
end
