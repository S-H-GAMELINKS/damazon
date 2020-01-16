require 'csv'

class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable

    def self.import_csv(file)

        CSV.foreach(file.path, headers: true) do |row|
    
          product = self.new
          product.attributes = row.to_hash.slice(*updatable_attributes)
    
          product.save!
        end
    end
end
