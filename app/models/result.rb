# frozen_string_literal: true

class Result < ApplicationRecord
  validates :subject, presence: true
  validates :marks, presence: true
end
