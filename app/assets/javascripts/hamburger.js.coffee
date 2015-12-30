class @Hamburger
  constructor: (@$hamburger) ->
    @menu = $("[data-hook='hamburger-menu']")
    @clickEvent()

  menuIsClosed: => @menu.hasClass "l-hide"
  openMenu: => @menu.removeClass "l-hide"
  closeMenu: => @menu.addClass "l-hide"
  toggleMenu: => if @menuIsClosed() then @openMenu() else @closeMenu()
  clickEvent: => @$hamburger.on "click", => @toggleMenu()
