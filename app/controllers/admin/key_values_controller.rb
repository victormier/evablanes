# encoding: utf-8

class Admin::KeyValuesController < Admin::ApplicationController
  before_filter :find_key_value, only: [:update]

  def update
    if @key_value.update_attributes(params[:key_value])
      flash[:notice] = "Valor actualitzat correctament"
      redirect_to :back
    else
      flash[:alert] = "Hi ha hagut un error"
      redirect_to :back
    end
  end

  private

  def find_key_value
    @key_value = KeyValue.find(params[:id])
  end
end