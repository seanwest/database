class DatabaseController < ApplicationController
  layout "database"
  
  
  before_filter :find_all_models
  before_filter :find_model, :except => [:all] 
  before_filter :find_row, :only => [:show]

  def all
  end
  
  def index
  end

  def show
    @columns = @model.columns.collect(&:name)
  end

  private
  
  def find_all_models
    Dir.glob('./app/models/*.rb').each do |file|
	    require file
    end

    @models = ActiveRecord::Base.descendants
  end
  
  def find_model
    name = params[:model].singularize.downcase.delete("_")
    @models.each do |model|
      @model = model if model.name.to_s.downcase == name
    end
    raise "There is no model with the name #{name}" if !@model
  end

  def find_row
    @id = params[:id]
    @row = @model.find @id
  end

end
