class UIView

  def x
    frame.origin.x
  end

  def x=(size)
    self.frame = [[size,y],[width,height]]
  end

  def y
    frame.origin.y
  end

  def y=(size)
    self.frame = [[x,size],[width,height]]
  end

  def width
    frame.size.width
  end

  def width=(size)
    self.frame = [[x,y],[size,height]]
  end

  def height
    frame.size.height
  end

  def height=(size)
    self.frame = [[x,y],[width,size]]
  end

end
