# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      render json: resource
    else
      render_error
    end
  end

  def render_error
    render json: { errors: resource.errors.full_messages },
    status: :unprocessable_entity
  end

end
