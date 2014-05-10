
class ThemeGroupsController < ApplicationController

  def index
    theme_groups = ThemeGroup.all
    render :json => theme_groups
  end

  def show
    theme_group = ThemeGroup.
                  includes(:weekly_themes => :posts).
                  find(params[:id])

    return head :unauthorized unless current_user.member?(theme_group)
    render  :json => theme_group,
            :serializer => ExtendedThemeGroupSerializer,
            :root => 'theme_group'
  end

  def join
    theme_group = ThemeGroup.find(params[:id])
    theme_group.users.push(current_user)
    theme_group.save!

    head :no_content
  end

  def users
    theme_group = ThemeGroup.find(params[:id])

    return head :unauthorized unless current_user.member?(theme_group)
    render  :json => theme_group.users.to_a,
            :root => 'users'
  end
end
