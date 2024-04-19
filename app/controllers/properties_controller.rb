class PropertiesController < ApplicationController
  def edit; end

  def update
    if current_property.update(property_params)
      redirect_to property_path, notice: "Property updated successfully"
    else
      render :edit
    end
  end

  private

    def property_params
      params
        .require(:property)
        .permit!
    end
end
