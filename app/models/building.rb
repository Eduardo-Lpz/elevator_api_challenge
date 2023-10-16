# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :elevators, dependent: :restrict_with_exception
end
