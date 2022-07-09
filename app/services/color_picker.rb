class ColorPicker

  def self.random
    self.new.random
  end
  
  def random
    color_list.sample
  end

  private

  def color_list
    [
        '#e6194b', '#3cb44b', '#ffe119', '#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#e6beff', '#9a6324', '#fffac8', '#800000', '#aaffc3', '#808000', '#ffd8b1', '#000075', '#808080'
    ]
  end

end
