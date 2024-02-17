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
class ActorSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :movies

  def movies
    ActiveModel::Serializer::CollectionSerializer.new(object.movies.with_avg_score, serializer: MovieSerializer)
  end
end
