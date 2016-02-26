class Bug < ActiveRecord::Base
    
    belongs_to :user
    
    enum issuetype: [:feature, :issue]
     enum priority: [:medium, :high, :low]
     enum status: [:open, :close]
     
     validates :title, presence: true
     validates :description, presence: true
end
