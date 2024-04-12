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
        .permit(
          rooms_attributes: [
            :id, :_destroy, :name, :kind,
            availabilities_attributes: %i[id _destroy date rate room_id]
          ]
        )
    end
end
