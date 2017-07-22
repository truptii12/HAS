class Med < ActiveRecord::Base
    
  def self.search(search)
    if search
      if Rails.env.development?
        where("firstname LIKE ?", "%#{search}%")
      elsif Rails.env.production?
        where("firstname ILIKE ?", "%#{search}%")
      end
    else
      all
    end
  end
end