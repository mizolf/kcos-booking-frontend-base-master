module PageHelper
  def resize_current_window_to(width, height)
    handle = page.driver.browser.window_handles.first
    page.driver.resize_window_to(handle, width, height)
  end

  def scroll_to(x, y)
    page.driver.execute_script("window.scrollTo(#{x},#{y})")
  end

  # Useful to scroll down slightly, so content will show up on page
  def scroll_down_slightly
    scroll_to(0, 1000)
  end

  def set_cookie(name, value)
    page.driver.browser.manage.add_cookie(name: name, value: value)
  end
end
