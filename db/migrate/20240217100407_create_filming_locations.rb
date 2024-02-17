# frozen_string_literal: true

class CreateFilmingLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :filming_locations do |t|
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
