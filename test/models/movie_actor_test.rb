# == Schema Information
#
# Table name: movie_actors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :bigint           not null
#  movie_id   :bigint           not null
#
# Indexes
#
#  index_movie_actors_on_actor_id  (actor_id)
#  index_movie_actors_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (actor_id => actors.id)
#  fk_rails_...  (movie_id => movies.id)
#
require "test_helper"

class MovieActorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
