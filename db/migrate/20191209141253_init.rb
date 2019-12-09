class Init < ActiveRecord::Migration[6.0]
  def change
    create_table :flightofferings do |t|
      t.integer :passenger_capacity, null: false
      t.string :departure_location
      t.string :arrival_location
      t.datetime :departure_time
      t.datetime :arrival_time
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
     ######################################################################
    create_table :passengers do |t|
      t.string :name , null: false
      t.string :email, null: false
      t.string :phone, null:false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    ####################################################################
    create_table :bookings do |t|
      t.references :passengers, index: true, foreign_key: true, null: false
      t.references :flightofferings, index: true, foreign_key: true, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    ############custom view for passenger manifest#######################
    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE VIEW flightmanifests AS
            SELECT
              f.id as flightofferings_id,
              p.id as passengers_id,
              p.name,
              p.email,
              p.phone
              FROM
              flightofferings f
              LEFT JOIN bookings b ON b.flightofferings_id = f.id
              LEFT JOIN passengers p ON p.id = b.passengers_id;
        SQL
      end
      dir.down do
        execute <<-SQL
          DROP VIEW IF EXISTS flightmanifests;
        SQL
      end
    end
  end
end
