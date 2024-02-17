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
class MovieSerializer < ActiveModel::Serializer
  attributes :id,
             :description,
             :director,
             :name,
             :year,
             :average_score,
             :reviews,
             :actors

  def actors
    object.actors.pluck(:name)
  end
end
