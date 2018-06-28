class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :weights, -> {order("date DESC")}, dependent: :destroy

  # after_create :build_default_profile
  has_one :profile, dependent: :destroy

  # def build_default_profile
  #   @profile = Profile.new(user_id: self.id)
  #   render_with_signed_in_user(
  #   self,
  #   template: 'profiles/new',  locals: {profile: @profile}
  #   )
  # end
  #
  # def render_with_signed_in_user(user, *args)
  #   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
  #   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
  #   renderer = ApplicationController.renderer.new('warden' => proxy)
  #   renderer.render(*args)
  # end
end
