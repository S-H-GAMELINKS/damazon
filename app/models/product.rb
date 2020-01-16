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

    def self.export_csv
      products = self.all

      CSV.generate do |csv|
        csv_column_names = %w(name description price category_id carriage)
        csv << csv_column_names
        products.each do |product|
          csv_column_values = [
            product.name,
            product.description,
            product.price,
            product.category_id,
            product.carriage
          ]
          csv << csv_column_values
        end
      end
    end
end
