class County < ActiveRecord::Base
  attr_accessible  :state_id,
                   :census_id,
                   :name

  belongs_to :state
  has_and_belongs_to_many :metros
  has_many :aggregations, :as => :explainable
  has_many :occupations, :as => :explainable
  
  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates  :census_id,
             :name, presence: true


  def to_csv
    CSV.generate do |csv|
      column_names = Aggregation.column_names - ["explainable_type","explainable_id", "created_at", "updated_at"]
      csv << column_names
      aggregations.each do |aggregation|
        csv << aggregation.attributes.values_at(*column_names)
      end
    end
  end

end
