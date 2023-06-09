# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  before_save -> { skip_confirmation! }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :referrals

  validates :name, presence: true
end
