# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders

  validates_presence_of :name, :email
end
