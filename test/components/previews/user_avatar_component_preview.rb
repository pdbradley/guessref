class UserAvatarComponentPreview < ViewComponent::Preview
  layout 'component_preview'
  def multi_word
    render(UserAvatarComponent.new(name: 'Phil Bradley Esquire'))
  end

  def one_word
    render(UserAvatarComponent.new(name: 'Phil'))
  end

  def red
    render(UserAvatarComponent.new(name: 'Phil', color: 'red'))
  end

end
