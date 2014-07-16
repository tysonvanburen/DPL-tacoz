class Location < ActiveRecord::Base
  include PgSearch
  # pg_search_scope :search, against: [:street_address, :city, :state]
  multisearchable against: [:street_address, :city, :state]

  geocoded_by :address
  after_validation :geocode

  has_many :employees
  accepts_nested_attributes_for :employees,
                                allow_destroy: true,
                                reject_if: ->(emp_attrs) { emp_attrs['name'].blank? }

  after_initialize :add_employee

  def address
    # 1234 Some St. Apt 4, Salt Lake City, UT 84123, US
    "#{street_address} #{street_address2}, #{city}, #{state} #{zip}, US"
  end

  def name
    address
  end

  private

  def add_employee
    employees.build if employees.empty?
  end

end
