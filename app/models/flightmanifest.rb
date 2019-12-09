class Flightmanifest < ApplicationRecord
    after_initialize :readonly!
end
