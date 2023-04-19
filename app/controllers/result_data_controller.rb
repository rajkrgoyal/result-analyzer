# frozen_string_literal: true

class ResultDataController < ApplicationController
  def create
    Result.create!(subject: params[:subject], marks: params[:marks])
    head :created
  end
end
