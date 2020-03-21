## Controller Action Name Helpers
#
# Simple view helpers to determine current action and controller name in
# a more readable manner within Rails views.
module ControllerActionNameHelpers
  ## Current controller name is in name or multiple names
  #
  # @example current controller_name is users
  #   controller?(:users)
  # @example current controller_name is in list
  #   controller?(:users, 'members')
  # @example use with an array of symbols
  #   controller?(*%i[users members guests])
  # @overload controller?(controller_name)
  #   @param controller_name [Symbol,String] a controller name
  # @overload controller?(controller_name1, controller_name2)
  #   @param controller_name1 [Symbol,String] a controller name
  #   @param controller_name2 [Symbol,String] a controller name
  #   @note takes unlimited amount of controller names.
  # @return [Boolean] the controller name is in list
  def controller?(*controller_names)
    controller_names.map(&:to_s).include?(controller_name)
  end
  alias controller_name? controller?
  alias controller_name_in? controller?

  ## Current action name is in name or multiple names
  #
  # @example current action is index
  #   action?(:index)
  # @example current action is index or show
  #   action?('index', :show)
  # @example use with an array of strings
  #   action?(*%w[index show custom])
  # @overload action?(action_name)
  #   @param action_name [Symbol,String] a action name
  # @overload action?(action_name1, action_name2)
  #   @param action_name1 [Symbol,String] a action name
  #   @param action_name2 [Symbol,String] a action name
  #   @note takes unlimited amount of action names.
  # @return [Boolean] the action name is in action_names
  def action?(*action_names)
    action_names.map(&:to_s).include?(action_name)
  end
  alias action_name? action?
  alias action_name_in? action?

  ## Current action and controller name in lists
  #
  # @example action name in array and controller name in array
  #   action_controller?(%w[index show custom], [:users, :members, 'guests'])
  # @param action_names [Array(Symbol,String)] the action name list
  # @param controller_names [Array(Symbol,String)] the controller name list
  # @return [Bolean] the action and controller name match lists
  def action_controller?(action_names, controller_names)
    action?(action_names) && controller?(controller_names)
  end
  alias action_controller_name? action_controller?

  ## Current controller and action name in lists
  #
  # @example action name in array and controller name in array
  #   action_controller?(%w[users members], ['index', :show, 'custom'])
  # @param controller_names [Array(Symbol,String)] the controller name list
  # @param action_names [Array(Symbol,String)] the action name list
  # @return [Bolean] the action and controller name match lists
  def controller_action?(controller_names, action_names)
    action?(action_names) && controller?(controller_names)
  end
  alias controller_action_name? controller_action?

  ## Current action name is index
  #
  def a_index?
    action_name == 'index'
  end
  alias action_index? a_index?
  alias action_name_index? a_index?

  ## Current action name is show
  #
  def a_show?
    action_name == 'show'
  end
  alias action_show? a_show?
  alias action_name_show? a_show?

  ## Current action name is new or create
  #
  # @note
  #   Often controllers do `render :new` when there is errors in forms.
  #   So it makes sense to be true when new or edit.
  # @param without_create [Boolean] only new action
  def a_new?(without_create = false)
    if without_create
      action_name == 'new'
    else
      action?(:new, :create)
    end
  end
  alias action_new? a_new?
  alias action_name_new? a_new?

  ## Current action name is edit or update
  #
  # @note
  #   Often controllers do `render :edit` when there is errors in forms.
  #   So it makes sense to be true when new or edit.
  # @param without_update [Boolean] only edit action
  def a_edit?(without_update = false)
    if without_update
      action_name == 'edit'
    else
      action?(:edit, :update)
    end
  end
  alias action_edit? a_edit?
  alias action_name_edit? a_edit?

  ## Current action name is index and controller name is in list
  #
  # @example current action is index and controller name is users
  #   ca_index?('users')
  # @example current action is index and controller name is in list
  #   ca_index?(:users, :members)
  # @overload ca_index?(controller_name)
  #   @param controller_name [Symbol,String] a controller name
  # @overload ca_index?(controller_name1, controller_name2)
  #   @param controller_name1 [Symbol,String] a controller name
  #   @param controller_name2 [Symbol,String] a controller name
  #   @note takes unlimited amount of controller names.
  # @return [Boolean] the controller name is in list
  def ca_index?(*controller_names)
    a_index? && controller?(*controller_names)
  end
  alias controller_index? ca_index?
  alias controller_names_index? ca_index?

  ## Current action name is show and controller name is in list
  #
  # @example current action is show and controller name is users
  #   ca_show?('users')
  # @example current action is show and controller name is in list
  #   ca_show?(:users, :members)
  # @overload ca_show?(controller_name)
  #   @param controller_name [Symbol,String] a controller name
  # @overload ca_show?(controller_name1, controller_name2)
  #   @param controller_name1 [Symbol,String] a controller name
  #   @param controller_name2 [Symbol,String] a controller name
  #   @note takes unlimited amount of controller names.
  # @return [Boolean] the controller name is in list
  def ca_show?(*controller_names)
    a_show? && controller?(*controller_names)
  end
  alias controller_names_show? ca_show?
  alias controller_show? ca_show?

  ## Current action name is new or create and controller name is in list
  #
  # @example current action is new or create and controller name is users
  #   ca_new?('users')
  # @example current action is new or create and controller name is in list
  #   ca_new?(:users, :members)
  # @overload ca_new?(controller_name)
  #   @param controller_name [Symbol,String] a controller name
  # @overload ca_new?(controller_name1, controller_name2)
  #   @param controller_name1 [Symbol,String] a controller name
  #   @param controller_name2 [Symbol,String] a controller name
  #   @note takes unlimited amount of controller names.
  # @return [Boolean] the controller name is in list
  def ca_new?(*controller_names)
    a_new? && controller?(*controller_names)
  end
  alias controller_names_new? ca_new?
  alias controller_new? ca_new?

  ## Current action name is edit or update and controller name is in list
  #
  # @example current action is edit or update and controller name is users
  #   ca_edit?('users')
  # @example current action is edit or update and controller name is in list
  #   ca_edit?(:users, :members)
  # @overload ca_edit?(controller_name)
  #   @param controller_name [Symbol,String] a controller name
  # @overload ca_edit?(controller_name1, controller_name2)
  #   @param controller_name1 [Symbol,String] a controller name
  #   @param controller_name2 [Symbol,String] a controller name
  #   @note takes unlimited amount of controller names.
  # @return [Boolean] the controller name is in list
  def ca_edit?(*controller_names)
    a_edit? && controller?(*controller_names)
  end
  alias controller_names_edit? ca_edit?
  alias controller_edit? ca_edit?
end
